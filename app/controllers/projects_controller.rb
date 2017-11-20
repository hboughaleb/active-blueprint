class ProjectsController < ApplicationController

  # before_action :set_task_project, only: [:show]
  before_action :set_project, only: [:show, :edit, :destroy]

  skip_before_action :authenticate_user!, only: :new


  def index         # GET /projects
    @projects = current_user.projects
  end

  def show          # GET /projects/:id
    if current_user != @project.user
      redirect_to root_path
    end
    @specialties = Specialty.where(project: @project).as_gantt_tasks
  end

  def new           # GET /projects/new
    @project = Project.new
  end

  def create        # POST /projects

    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save!

      generate = params[:generate][:type]
      if generate != "" && false
        if generate == "Building a Villa"
          Task.create!(specialty: "Founder", project: @project, title: "Build a foundation", budget: "1000000", status: "Stand by", start_date: Date.today, end_date: Date.today+1)
          Task.create!(specialty: "Roofer", project: @project, title: "Put a roof on it", budget: "10000", status: "Stand by", start_date: Date.today, end_date: Date.today+3)
          Task.create!(specialty: "Waller", project: @project, title: "Walls would be good", budget: "1000000", status: "Stand by", start_date: Date.today, end_date: Date.today+5)
        elsif "Remodeling an Apartment"
          Task.create!(specialty: "Swinger", project: @project, title: "Tear down the walls", budget: "1000000", status: "Stand by", start_date: Date.today, end_date: Date.today+1)
          Task.create!(specialty: "Finisher", project: @project, title: "Finish the floors", budget: "10000", status: "Stand by", start_date: Date.today, end_date: Date.today+3)
          Task.create!(specialty: "Painter", project: @project, title: "Paint walls", budget: "1000000", status: "Stand by", start_date: Date.today, end_date: Date.today+5)
        end
      end
      redirect_to projects_path(@project)
    else
      render :new
    end
  end


  def edit          # GET /projects/:id/edit
  end

  def update        # PATCH /projects/:id
    if @project.update(project_params)
      @project.save!
      redirect_to projects_path(@project)
    else
      render :edit
    end
  end

  def destroy       # DELETE /projects/:id
    @project.destroy
    redirect_to projects_path
  end

  private

  # def set_task_project
  #   @task = Task.find(params[:id])
  # end

  def set_project
    @project = Project.find(params[:id || :project_id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :projected_budget, :address, :status)
  end
end
