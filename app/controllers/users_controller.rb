class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index         # GET /users
  end

  def show          # GET /users/:id
    @projects = @user.projects
  end

  # def new           # GET /users/new
  #   @user = User.new
  # end

  # def create        # POST /users
  #   @user = User.new(user_params)
  #   if @user.save
  #     redirect_to user_path(current_user)
  #   else
  #     render :new
  #   end
  # end

  # def edit          # GET /users/:id/edit
  # end

  # def update        # PATCH /users/:id
  # end

  # def destroy       # DELETE /users/:id
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
