class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    if current_user.nil?
      redirect_to new_user_session_path
    elsif current_user.winch == true
      redirect_to user_winches_path(current_user)
    else
      redirect_to new_trip_path
    end
  end
end
