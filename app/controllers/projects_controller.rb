class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  skip_before_action :authenticate_user!, only: :new


  def index         # GET /projects
    @projects = current_user.projects
  end

  def show          # GET /projects/:id
    if current_user != @project.user
      redirect_to root_path
    end
    @specialties = Specialty.where(project: @project).as_gantt_tasks
    @specialtiez = Specialty.where(project: @project)
  end

  def new           # GET /projects/new
    @project = Project.new
  end

  def create        # POST /projects
    @project = Project.new(project_params)
    @project.user = current_user


    Project::PROJECT_TEMPLATE.each do |key, value|
      binding.pry
      # specialties.each do |specialty|
      #   s = Specialty.create(name: specialty.name, description: specialty.description ...)
      #   specialty.tasks.each do |task|
      #     t = Task.create(title: task.title, description: task.description, start: s.start + task.start ...)
      #   end
      # end
    end

    params["project"]["specialties"].reject(&:empty?).each do |specialty|
      if specialty == "carpenter"
        specialty_budget = ( projected_budget * 20 ) / 100
        specialty = Specialty.create(name: specialty, start: project_start, finish: project_end, progress: 0, dependencies: '', custom_class: '#{specialty}-class')
        task_1 = Task.create!(specialty: specialty, description: "Phase 1 description", name: "Phase 1", budget: ( ( specialty_budget * 25 )/100 ), status: "Stand by", start: Date.today, finish: Date.today + 20, progress: 0, custom_class: "task-1-class")
        task_2 = Task.create!(specialty: specialty, description: "Phase 2 description", name: "Phase 2", budget: ( ( specialty_budget * 25 )/100 ), status: "Stand by", start: Date.today + 10, finish: Date.today + 30, progress: 0, custom_class: "task-1-class", dependencies: "#{task_1.id}")
        task_3 = Task.create!(specialty: specialty, description: "Phase 3 description", name: "Phase 3", budget: ( ( specialty_budget * 25 )/100 ), status: "Stand by", start: Date.today + 20, finish: Date.today + 40, progress: 0, custom_class: "task-1-class", dependencies: "#{task_2.id}")
        task_4 = Task.create!(specialty: specialty, description: "Phase 4 description", name: "Phase 4", budget: ( ( specialty_budget * 25 )/100 ), status: "Stand by", start: Date.today + 30, finish: Date.today + 50, progress: 0, custom_class: "task-1-class", dependencies: "#{task_3.id}")

      elsif specialty == "roofer"
        specialty_budget = ( projected_budget * 40 ) / 100
        specialty = Specialty.create(name: specialty, start: project_start, finish: project_end, progress: 0, dependencies: '', custom_class: '#{specialty}-class')
        task_1 = Task.create!(specialty: specialty, description: "Phase 1 description", name: "Phase 1", budget: ( ( specialty_budget * 25 )/100 ), status: "Stand by", start: Date.today, finish: Date.today + 20, progress: 0, custom_class: "task-1-class")
        task_2 = Task.create!(specialty: specialty, description: "Phase 2 description", name: "Phase 2", budget: ( ( specialty_budget * 25 )/100 ), status: "Stand by", start: Date.today + 10, finish: Date.today + 30, progress: 0, custom_class: "task-1-class", dependencies: "#{task_1.id}")
        task_3 = Task.create!(specialty: specialty, description: "Phase 3 description", name: "Phase 3", budget: ( ( specialty_budget * 25 )/100 ), status: "Stand by", start: Date.today + 20, finish: Date.today + 40, progress: 0, custom_class: "task-1-class", dependencies: "#{task_2.id}")
        task_4 = Task.create!(specialty: specialty, description: "Phase 4 description", name: "Phase 4", budget: ( ( specialty_budget * 25 )/100 ), status: "Stand by", start: Date.today + 30, finish: Date.today + 50, progress: 0, custom_class: "task-1-class", dependencies: "#{task_3.id}")

      end
    end

    if @project.save!

      # generate = params[:generate][:type]
      # if generate != "" && false
      #   if generate == "Building a Villa"
      #     Task.create!(specialty: "Founder", project: @project, title: "Build a foundation", budget: "1000000", status: "Stand by", start_date: Date.today, end_date: Date.today+1)
      #     Task.create!(specialty: "Roofer", project: @project, title: "Put a roof on it", budget: "10000", status: "Stand by", start_date: Date.today, end_date: Date.today+3)
      #     Task.create!(specialty: "Waller", project: @project, title: "Walls would be good", budget: "1000000", status: "Stand by", start_date: Date.today, end_date: Date.today+5)
      #   elsif "Remodeling an Apartment"
      #     Task.create!(specialty: "Swinger", project: @project, title: "Tear down the walls", budget: "1000000", status: "Stand by", start_date: Date.today, end_date: Date.today+1)
      #     Task.create!(specialty: "Finisher", project: @project, title: "Finish the floors", budget: "10000", status: "Stand by", start_date: Date.today, end_date: Date.today+3)
      #     Task.create!(specialty: "Painter", project: @project, title: "Paint walls", budget: "1000000", status: "Stand by", start_date: Date.today, end_date: Date.today+5)
      #   end
      # end
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

  def project_params
    params.require(:project).permit(:title, :description, :start_date, :end_date, :projected_budget, :address, :status)
  end
end
