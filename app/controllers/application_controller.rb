class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :check_navbar

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :photo, :photo_cache])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :photo, :photo_cache])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  def check_navbar(params)
    case params[:controller]
      when 'trip_requests'
        'position-absolute' if params[:action] == 'show'
      when 'trips'
        'position-absolute' if params[:action] == 'new' || params[:action] == 'show' || params[:action] == 'delivered'
      when 'pages'
        'position-absolute' if params[:action] == 'home'
      else
        ''
    end
  end

end
