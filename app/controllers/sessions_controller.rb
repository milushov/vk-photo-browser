class SessionsController < ApplicationController

  def new
    session[:state] = Digest::MD5.hexdigest(rand.to_s)
    redirect_to VkontakteApi.authorization_url(scope: [:photos], state: session[:state])
  end

end
