class ProjectPolicy < ApplicationPolicy

attr_reader :user, :project

  def initialize(user, project)
    @user = user
    @project = project
  end

  def new?
    @user.user_type == "Manager"
  end

  def edit?
    @user.user_type == "Manager"
  end

  def update?
    @user.user_type == "Manager"
  end

  def can_edit?
    @user.id == @project.creator
  end

  def can_update?
    @user.id == @project.creator
  end

  def show?
    @user.id == @project.creator
  end
end
