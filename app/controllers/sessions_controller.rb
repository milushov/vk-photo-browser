class SessionsController < ApplicationController

  before_filter :check_state, only: [:callback]

  def new
    session[:state] = Digest::MD5.hexdigest(rand.to_s)
    redirect_to VkontakteApi.authorization_url(scope: [:photos], state: session[:state])
  end

  def callback
    vk = VkontakteApi.authorize(code: params[:code])
    session[:token] = vk.token
    session[:vk_id] = vk.user_id
    redirect_to root_path
  end

  private

    def check_state
      redirect_to new_sessions_path and return unless session[:state] == params[:state]
    end

end
