# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @already_followed = Following.exists?(subscriber_id: current_user.id, target_id: params[:id])
    @user = User.find(params[:id])
  end

  def following
    @following = User.find(params[:id]).targets
  end

  def follow
    follow = Following.new(subscriber_id: current_user.id, target_id: params[:id])
    follow.save unless Following.exists?(subscriber_id: current_user.id, target_id: params[:id])
    redirect_back(fallback_location: '/')
  end

  def unfollow
    follow = Following.find_by(subscriber_id: current_user.id, target_id: params[:id])
    follow&.destroy
    redirect_back(fallback_location: '/')
  end
end
