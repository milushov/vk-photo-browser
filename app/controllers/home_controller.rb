class HomeController < ApplicationController

  before_filter :user_should_be_authorized
  before_filter :current_user

  def index
    render text: '', layout: true
  end

end
