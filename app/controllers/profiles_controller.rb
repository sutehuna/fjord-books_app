# frozen_string_literal: true

class ProfilesController < ApplicationController
  def edit
    @user = current_user
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(profile_params)
    redirect_to controller: :profiles, action: :show
  end

  private

  def profile_params
    params.require(:user).permit(:postal_code, :address, :self_introduction)
  end
end
