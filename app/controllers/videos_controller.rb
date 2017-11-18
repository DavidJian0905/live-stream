class VideosController < ApplicationController
  before_action :authenticate_user!

  def index
    @videos = Video.order("created_at DESC").all
  end

  def show
    @video = Video.find(params[:id])
  end

  def new
    @videos = Video.new
  end

  def create
    @videos = Video.new(video_params)
    if @videos.save
      respond_to do |format|
        format.html {redirect_to videos_path, notice: 'Video Have been removed.'}
      end
    end
  end

  def destroy
    @videos.destroy
    respond_to do |format|
      format.html {redirect_to videos_path, notice: 'Video Have been removed.'}
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :description, :video)
  end


end
