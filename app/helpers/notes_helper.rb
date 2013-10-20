module NotesHelper
	def publish_option_list
    options=""
    [true,false].each do |index|
      options+="<option value=#{index}>#{index}</option>"
    end
    options.html_safe
  end
end
