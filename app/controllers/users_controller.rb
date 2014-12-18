class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    # @jobs = @user.jobs.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def reviewing
    @title = "Reviewing"
    @user = User.find(params[:id])
    @users = @user.reviewings.paginate(page: params[:page])
  end

  def revieweds
    @title = "Revieweds"
    @user = User.find(params[:id])
    @users = @user.revieweds.paginate(page: params[:page])
  end

  def apply
    @title = 'Apply jobs'
    @job = current_user.jobs.build
    @feed_jobs = current_user.apply_jobs.paginate(page: params[:page])
    render template: 'about/index'
  end

  def tag_cloud
    # order('count DESC')でカウントの多い順にタグを並べています
    @tags = User.tag_counts_on(:tags).order('count DESC')
  end

private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :introduction)
    end

    # Before actions

    def set_user
      @user = User.find(params[:id])
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

end
