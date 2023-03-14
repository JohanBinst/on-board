class ProfilesController < ApplicationController
  # skip_before_action :ask_for_preferences, only: [:set_preferences, :update]

  # def set_preferences
  end

  def update
    if current_user.update(profile_params)
      redirect_to root_path
    else
      puts "Hello"
      puts current_user.errors.full_messages
      render :set_preferences, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(preferences: [])
  end
end
