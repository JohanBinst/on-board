class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :ask_for_preferences

  private

  def ask_for_preferences
    if current_user && current_user.preferences.nil?
      redirect_to set_preferences_path unless request.path == set_preferences_path
    end
  end
end
