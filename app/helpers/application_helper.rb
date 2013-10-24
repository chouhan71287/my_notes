module ApplicationHelper

	def truncate_text(text,size=50)
		truncate text, length: size
	end

end
