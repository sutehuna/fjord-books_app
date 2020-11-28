# frozen_string_literal: true

class ProfilesController < ApplicationController

  def index
    @users = User.order(:id).page(params[:page])
  end

  def edit
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = current_user
    if @user.update(profile_params)
      redirect_to controller: :profiles, action: :show
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:user).permit(:postal_code, :address, :self_introduction)
  end
end
