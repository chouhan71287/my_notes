class HomeController < ApplicationController

	def home
		redirect_to public_notes_notes_path
	end

	def index
		redirect_to public_notes_notes_path
	end

end
