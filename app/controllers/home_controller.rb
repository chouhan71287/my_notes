class HomeController < ApplicationController

	def home
	end

	def index
		redirect_to public_notes_notes_path
	end

end
