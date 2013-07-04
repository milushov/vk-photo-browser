class AlbumsController < ApplicationController

  before_filter :user_should_be_authorized
  before_filter :current_user

  def index
    @albums = @vk.photos.get_albums(uid: @user.uid, need_covers: 1)

    respond_to do |format|
      format.json { render json: @albums.to_json }
    end
  end


  def show
    @photos = @vk.photos.get(uid: @user.uid, aid: params[:id])

    respond_to do |format|
      format.json { render json: @photos.to_json }
    end
  end
  
end
