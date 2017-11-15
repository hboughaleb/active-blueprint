class ProjectsController < ApplicationController

    skip_before_action :authenticate_user!, only: :new


  def index         # GET /projects
  end

  def show          # GET /projects/:id
  end

  def new           # GET /projects/new
    @project = Project.new
  end

  def create        # POST /projects
  end

  def edit          # GET /projects/:id/edit
  end

  def update        # PATCH /projects/:id
  end

  def destroy       # DELETE /projects/:id
  end

end
