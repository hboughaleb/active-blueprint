class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_specialty, only: [:create, :new, :show, :edit, :destroy]
  before_action :set_project, except: [ :full_index]
  def index         # GET /tasks
    @tasks = Task.all
  end

  def full_index
    @tasks = Task.where(user: current_user)
  end

  def show          # GET /tasks/:id

  end

  def new           # GET /tasks/new
    @task = Task.new
  end

  def create        # POST /tasks
    @task = Task.new(task_params)
    # @task.user = current_user
    @task.specialty = @specialty
    if @task.save!
      redirect_to project_specialty_tasks_path(current_user)
    else
      render :new
    end
  end

  def edit          # GET /tasks/:id/edit
    if @task.update(task_params)
      redirect_to project_specialty_task_path(@specialty, @task)
    else
      render :edit
    end
  end

  def update        # PATCH /tasks/:id
    if current_user == Task.find(params[:id]).project.specialty.user
      Task.update_from_params(params)
    end
  end

  def destroy       # DELETE /tasks/:id
    @task.destroy
    redirect_to project_specialty_path(@specialty)
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_specialty
    @specialty = Specialty.find(params[:specialty_id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:name, :description, :budget, :priority, :start, :finish, :specialty, :status, :user_id, :specialty_id, :project_id)
  end

end
