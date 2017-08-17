class BugsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_bug , only: [:show, :edit, :destroy, :update]

  def index
    @bugs = @project.bugs.all
  end

  def new
    authorize Bug
    @bug = @project.bugs.build
  end

  def create
    @bug  = @project.bugs.build(bug_params)
    respond_to  do  |format|
      if  @bug.save
        format.html { redirect_to [@project,@bug], notice: 'Bug was successfully created.' }
      else
        format.html { render  action: 'new' }
      end
    end
  end

  def edit
    authorize Bug
  end

  def update
    authorize Bug
    respond_to  do  |format|
      if  @bug.update(bug_params)
        format.html { redirect_to [@project,@bug], notice: 'Product  was successfully updated.' }
      else
        format.html { render  :edit }
      end
    end
  end
  def show
    @user = User.find(@bug.created_by)
  end

  def destroy
    authorize Bug
    @bug.destroy
    respond_to  do  |format|
      format.html { redirect_to project_bugs_path, notice: 'Bug was successfully  destroyed.' }
    end
  end

  def assign
    Bug.update(params[:id], :assign_to => current_user.name , :status => "Started")
    respond_to do |format|
      format.json { render json: User.find(current_user.id) }
    end
  end

  def complete
    Bug.update(params[:id], :status => "Completed")
  end


  private
  def set_project
    @project = Project.find(params[:project_id])
  end


  def set_bug
    @bug = @project.bugs.find(params[:id])
  end

  def bug_params
    params.require(:bug).permit(:title, :deadline , :screenshot , :bug_type , :status).merge(created_by: current_user.id)
  end

end
