class SpecialtiesController < ApplicationController
  before_action :set_project
  before_action :set_specialty, only: [:show, :edit, :update]

  def new
    @specialty = Specialty.new
  end

  def create
    @specialty = Specialty.new(specialty_params)
    manage_dependencies
    @specialty.project = @project
    if @specialty.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def gantt_update
    project = Project.find(params[:project_id])
    if current_user == project.user
      Specialty.update_from_params(params)
    end
  end

  def update
    manage_dependencies
    if @specialty.update(specialty_params)
      redirect_to project_specialty_path(@project, @specialty)
    else
      render :edit
    end
  end

  def edit
  end

  def destroy
    @task.destroy
    redirect_to project_specialty_path(@specialty)
  end

  def index
    @specialties = Specialty.all
  end

  def show
    @tasks = Specialty.find(params[:id]).tasks.order(:created_at).as_gantt_tasks
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

  def manage_dependencies
    if params[:possible_dependencies]
      params[:possible_dependencies].keys.each do |possible_dependency|
        if params[:dependencies] && params[:dependencies].include?(possible_dependency)
          if !@specialty.is_dependent_on.to_a.include?(Specialty.find(possible_dependency))
            @specialty.add_dependency(possible_dependency)
          end
        elsif
          if @specialty.is_dependent_on.to_a.include?(Specialty.find(possible_dependency))
            @specialty.remove_dependency(possible_dependency)
          end
        end
      end
    end
  end
end
