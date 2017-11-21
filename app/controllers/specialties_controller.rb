class SpecialtiesController < ApplicationController
  before_action :set_project, only: [:create, :new, :show, :edit, :destroy]
  before_action :set_specialty, only: [:show]
  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.new(specialty_params)
    # @specialty.user = current_user
    @specialty.project = @project
    if @specialty.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def update
    if current_user == Project.find(params[:project_id]).user
      Specialty.update_from_params(params)
    end
  end

  def edit
    if @specialty.update(specialty_params)
      redirect_to project_path(@project)
    else
      render :edit
    end
  end

  def destroy
  end

  def index
    @specialties = Specialty.all
  end

  def show
    @specialties = Task.all.as_gantt_tasks
  end

  private

  def set_specialty
    @specialty = Specialty.find(params[:id ])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def specialty_params
    params.require(:specialty).permit(:name, :start, :finish, :progress, :dependencies, :custom_class, :id, :project_id)
  end
end
