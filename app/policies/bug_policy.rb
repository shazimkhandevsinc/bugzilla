class BugPolicy < ApplicationPolicy

attr_reader :user, :bug

  def initialize(user ,bug)
    @user = user
    @bug = bug
  end


  def new?
    @user.user_type == "QA"
  end

  def destroy?
    @user.user_type == "QA"
  end
  def edit?
    @user.user_type == "QA"
  end

  def update?
    @user.user_type == "QA"
  end

  def index?
    @user.id == @project.creator
  end

end
