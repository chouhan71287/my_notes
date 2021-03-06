class Note < ActiveRecord::Base
  before_create :randomize_file_name
  #developer@yopmail.com / 11111111
  #attr_accessor :notes_avatar_file_name, :mynotes_file_file_name, :notes_avatar
  attr_accessible :title, :description, :price, :mynotes_file, :publish, :author, :notes_avatar, :user_id, :notes_type_id
  
 # attr_accessor :check_format
   belongs_to :user

   has_attached_file :mynotes_file,
	:storage => :dropbox,
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
    :dropbox_options => {
      :unique_filename => false
    }

   has_attached_file :notes_avatar,
    :storage => :dropbox,
    :styles => { :small => "150x150>", :medium => "300x300>", :large => "600x600>" },
    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
    :dropbox_options => {
      :unique_filename => false
    }

    validates_format_of :mynotes_file_file_name, :message => "Accept only pdf", :with => %r{\.(pdf)$}i
    validates_attachment_content_type :notes_avatar, :content_type => ['image/jpeg', 'image/png','image/jpg'],:message=>"file type is not allowed (only jpeg/png/gif images)"

    validates :title, :price, :description, :author, :notes_avatar ,:presence => true
    validates_attachment_size :mynotes_file, :less_than => 5.megabytes, :message=> "size less than 1 MB"
    validates_attachment_size :notes_avatar, :less_than => 200.kilobytes, :message=> "size less than 200 KB"

    validates :description, length: { in: 50..500 }, :if => :description_is_blank?

    scope :free_notes, lambda { where("price = ? and publish = ?", 0, true)}
    scope :chargeable_notes, lambda { where("price != ? and publish=?", 0, true)}
    scope :search, lambda{|q| where("lower(title) like ? or lower(description) like ? or lower(author) like ? or notes_type_id in (?)", q.downcase, q.downcase, q.downcase, NotesType.where('lower(name) like ?', q.downcase).map(&:id))}

  def description_is_blank?
    !!self.description
  end

  def self.search_result(q, is_free)
    res = search(q)
    is_free ? res.delete_if{|b| b.price > 0} : res
  end

  def self.decoding_notes_id(notes_id)
     Base64.decode64(notes_id.to_s)
  end

 private

  def randomize_file_name
    unless mynotes_file_file_name.nil?
      extension = File.extname(mynotes_file_file_name).downcase
      self.mynotes_file.instance_write(:file_name, "#{Time.now.to_i.to_s}#{extension}")
    end

    unless notes_avatar_file_name.nil?
      extension = File.extname(notes_avatar_file_name).downcase
      self.notes_avatar.instance_write(:file_name, "#{Time.now.to_i.to_s}#{extension}")
    end
  end

end
