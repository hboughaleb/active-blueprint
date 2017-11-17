class ProjectsController < ApplicationController
  before_action :set_task_project, only: [:show]
  before_action :set_project, only: [:show]
  skip_before_action :authenticate_user!, only: :new


  def index         # GET /projects
    @projects = current_user.projects
  end

  def show          # GET /projects/:id
    if current_user != @project.user
      redirect_to root_path
    end
  end

  def new           # GET /projects/new
    @project = Project.new
  end

  def create        # POST /projects
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save!
      redirect_to project_path(current_user)
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

  def set_task_project
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:id || :project_id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :projected_budget, :address, :status)
  end
end
