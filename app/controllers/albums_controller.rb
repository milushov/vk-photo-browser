class AlbumsController < ApplicationController

  before_filter :user_should_be_authorized
  before_filter :current_user

  def index
    @albums = @vk.photos.get_albums(uid: @user.uid, need_covers: 1).first
  end
  
end
