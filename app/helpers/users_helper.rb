module UsersHelper

	def role_list
    options=""
    ["Writer","Reader"].each do |index|
      options+="<option value=#{index}>#{index}</option>"
    end
    options.html_safe
  end

end
