module NotesHelper
	def publish_option_list
    options=""
    [true,false].each do |index|
      options+="<option value=#{index}>#{index}</option>"
    end
    options.html_safe
  end

  def encoding_notes_id(notes_id)
  	Base64.encode64(notes_id.to_s)
  end

end
