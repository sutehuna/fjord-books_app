# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.order(:id).page(params[:page])
  end

  def show
    @already_followed = Following.exists?(subscriber_id: current_user.id, target_id: params[:id])
    @user = User.find(params[:id])
  end
end
