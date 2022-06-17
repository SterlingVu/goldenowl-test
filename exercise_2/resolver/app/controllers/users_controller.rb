class UsersController < ApplicationController
  before_action :prepare_user, only: %i[show]

  def index
    @users = User.all
  end

  def show; end

  def follow_user
    follow_user = Following.find_or_initialize_by(user_id: follow_user_params[:user_id], following_id: follow_user_params[:following_id])

    follow_user.save
    redirect_to users_path, notice: 'Successful manipulation!'
  end

  def view_my_following
    @my_following = Following.where(user_id: params[:id])
  end

  def view_my_followers
    @my_followers = Following.where(following_id: params[:id])
  end

  def my_new_followers
    first_of_month = Date.current.beginning_of_month
    last_of_next_month = Date.current.end_of_month

    @my_new_followers = Following.where(user_id: params[:id])
                                 .where('created_at BETWEEN ? AND ?', first_of_month, last_of_next_month)
  end

  def top__users_with_most_followers
    # @top_user = Following.group(:following_id)
  end

  private

  def prepare_user
    @user = User.find_by(id: params[:id])
    @following = Following.new
  end

  def follow_user_params
    params.require(:following).permit(:user_id, :following_id)
  end
end
