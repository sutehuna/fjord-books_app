class Users::FollowingsController < ApplicationController
  def index
    @following = User.find(params[:user_id]).targets
  end

  def create
    follow = Following.new(subscriber_id: params[:user_id], target_id: params[:target_id])
    follow.save unless Following.exists?(subscriber_id: params[:user_id], target_id: params[:target_id])
    redirect_back(fallback_location: '/')
  end

  def destroy
    follow = Following.find_by(subscriber_id: params[:user_id], target_id: params[:id])
    follow&.destroy
    redirect_back(fallback_location: '/')
  end
end
