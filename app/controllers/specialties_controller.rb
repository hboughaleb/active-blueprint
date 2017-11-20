class SpecialtiesController < ApplicationController
  before_action :set_project, only: [:create, :new, :show, :edit, :destroy]
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
    current_user == Specialty.find(params[:id]).project.user
    Specialty.update_from_params(params)
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
  end

  private

  def set_specialty
    @specialty = Specialty.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def specialty_params
    params.require(:specialty).permit(:name, :start, :finish, :progress, :dependencies, :custom_class, :project_id)
  end
end
