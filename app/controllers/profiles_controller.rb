class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :specified_profile, only: [:edit, :update]
  before_action :specified_user, only: [:edit]

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
      redirect_to profile_path(current_user.id), notice: 'プロフィールの作成に成功しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profile_path(current_user.id), notice: 'プロフィールの更新に成功しました'
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:text).merge(user_id: current_user.id)
  end

  def specified_profile
    @profile = Profile.find_by(user_id: params[:id])
  end

  def specified_user
    redirect_to root_path unless @profile.user.id == current_user.id
  end
end
