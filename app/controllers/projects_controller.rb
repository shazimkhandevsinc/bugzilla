class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project  , only: [:show , :edit , :update , :destroy]

  #############################################
  # Show all Projects
  def index
    if current_user.user_type == "Developer"
      @projects = current_user.projects
    elsif current_user.user_type == "QA"
      @projects = Project.all
    else
      @projects = Project.where(:creator => current_user.id)
    end
  end
  #############################################

  #############################################
  # Create New Project
  def new

    @project = Project.new
    authorize Project
    @user_list = User.where('user_type' => 'Developer')

  end
  #############################################

  #############################################
  # Show Project
  def show
    authorize @project
    @users = @project.users
  end
  #############################################

  #############################################
  # Destroy Project with all relevant data
  def destroy
    @project.destroy
    respond_to  do  |format|
      format.html { redirect_to projects_url, notice: 'Product  was successfully  destroyed.' }
    end
  end

  #############################################
  # Edit Record

  def edit
    authorize @project
    authorize @project, :can_edit?
    @user_list = User.where('user_type' => 'Developer' )
  end

  #############################################


  #############################################
  # Update Record
  def update
    authorize @project
    authorize @project, :can_update?
    respond_to  do  |format|
      if  @project.update(project_params)
        format.html { redirect_to @project, notice: 'Product  was successfully updated.' }
      else
        format.html { render  :edit }
      end
    end
  end

  #############################################


  #############################################
  # Create New Project and add users to the product
  def create

    @project  = Project.new(project_params)

    respond_to  do  |format|
      if  @project.save
        format.html { redirect_to @project , notice: 'Product  was successfully created.' }
      else
        format.html { render  :new  }
      end
    end
  end

  #############################################
  # get Project Parameters
  def project_params
      params.require(:project).permit(:title,  :description , user_ids: []).merge(creator: current_user.id)
  end
  #############################################


  #############################################
  # set project with id passed
  def set_project
    @project  = Project.find(params[:id])
  end
  #############################################


end
