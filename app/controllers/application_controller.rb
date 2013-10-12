class ApplicationController < ActionController::Base
  protect_from_forgery

  def default_url_options
    if Rails.env.production?
      {:host => "vijaychouhan.in"}
    end
  end

end
