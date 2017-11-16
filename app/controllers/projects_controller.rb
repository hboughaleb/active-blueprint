class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]
  # before_action :set_project, only: [:show, :new]
  # before_action :set_user, only: [:create]
  skip_before_action :authenticate_user!, only: :new


  def index         # GET /projects
    @projects = Project.all
  end

  def show          # GET /projects/:id
    @project = Project.find(@project)
  end

  def new           # GET /projects/new
    @project = Project.new
  end

  def create        # POST /projects
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save!
      redirect_to user_path(current_user)
    else
      render :new
    end
  end


  def edit          # GET /projects/:id/edit
  end

  def update        # PATCH /projects/:id
  end

  def destroy       # DELETE /projects/:id
  end

  private

   def set_project
    @project = Project.find(params[:id])

  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :projected_budget, :address, :status)
  end
end
