class NotesController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def new
  	@notes = Notes.new
    
    @my_notes = Notes.all
  end

  def create
  	@notes = Notes.new(params[:notes])
  	if @notes.valid?
  	  @notes.save
  	  redirect_to new_note_path, :notice=>"Your notes is succefully created"
  	else
  	  render :new
  	end
  end

end
