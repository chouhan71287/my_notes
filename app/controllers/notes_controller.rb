class NotesController < ApplicationController
  before_filter :authenticate_user!, :only=>[:index,:new,:create]

  def index
  end

  def new
  	@notes = Note.new
  end

  def create
  	@notes = current_user.notes.build(params[:note])
  	if @notes.valid?
  	  @notes.save
  	  redirect_to new_note_path, :notice=>"Your notes is succefully created"
  	else
  	  render :new
  	end
  end

  def show
    @note = Note.find(params[:id].to_i)
  end

  def public_notes
    @public_notes = Note.free_notes
    @chargeable_notes = Note.chargeable_notes.order("price")
  end

  def public_notes_image
    notes = Note.find(params["public_notes"].to_i)
    render :partial=>"notes/image_load", :locals => { :public_notes => notes.notes_avatar.url(:medium), :show_notes=>notes.id }
  end

  def free_download
    if current_user
      notes = Note.find(Note.decoding_notes_id(params["public_notes"]).to_i)
      download_url = notes.mynotes_file.url(:download => true)
      render :partial=>"free_download", :locals => { :download_url => download_url }
    else
      render :text=>"You need to sign in or sign up before continuing."
    end
  end

end
