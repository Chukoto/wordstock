class ProfilesController < ApplicationController
  def show
    @user = User.find(params[:id])
    @profile = Profile.find_by(user_id: params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to profile_path(current_user.id)
    else
      render root_path
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:text).merge(user_id: current_user.id)
  end

end
