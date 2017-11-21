class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  # before_action :set_specialty, only: [:show]
  skip_before_action :authenticate_user!, only: :new


  def index         # GET /projects
    @projects = current_user.projects
  end

  def show          # GET /projects/:id
    if current_user != @project.user
      redirect_to root_path
    end
    @specialties = Specialty.where(project: @project).order(:id).as_gantt_tasks
    @specialtiez = Specialty.where(project: @project).order(:id)
  end

  def new           # GET /projects/new
    @project = Project.new
  end

  def create        # POST /projects
    @project = Project.new(project_params)
    @project.user = current_user
    budget = @project.projected_budget

    if @project.save
      Project::PROJECT_TEMPLATE.each do |key, types|
        if params["generate"]["type"] == key.to_s
          types.each do |key, specialties|
            specialties.each do |key, specialty|
              s = Specialty.create(name: specialty[:name], budget: (budget * specialty[:percentage_budget])/100 ,
                start:  @project.start_date + specialty[:start], finish: @project.end_date - specialty[:finish],
                progress: 5, dependencies: specialty[:dependencies],
                custom_class: specialty[:custom_class])
              specialty.each do |key, task|
                Task.create!(specialty: s, description: task[:description],
                  name: task[:name], budget: (s.budget * task[:percentage_budget]) / 100,
                  status: "Stand by", start: s.start + task[:start], finish: s.start + task[:finish],
                  progress: 5, custom_class: task[:custom_class])
              end
            end
          end
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
    @project = Project.find(params[:id || :specialty_id])
  end

  def set_specialty
    @specialty = Specialty.find(params[:id || :specialty_id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :projected_budget, :address, :status)
  end
end
