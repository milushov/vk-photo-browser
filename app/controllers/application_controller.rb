class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def user_should_be_authorized
      redirect_to new_sessions_path unless session[:vk_id]
    end

    def current_user
      @vk   = VkontakteApi::Client.new(session[:token])
      @user = @vk.users.get(uid: session[:vk_id], fields: [:screen_name, :photo_big]).first
    end

end
