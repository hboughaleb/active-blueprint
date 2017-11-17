class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_project, except: [:destroy, :full_index]
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
    @task.project = @project
    if @task.save!
      redirect_to project_tasks_path(current_user)
    else
      render :new
    end
  end

  def edit          # GET /tasks/:id/edit

  end

  def update        # PATCH /tasks/:id
    if @task.update(task_params)
      redirect_to project_task_path(@task)
    else
      render :edit
    end
  end

  def destroy       # DELETE /tasks/:id
    @task.destroy
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit(:title, :description, :budget, :priority, :start_date, :end_date, :specialty, :status, :user_id)
  end

end
