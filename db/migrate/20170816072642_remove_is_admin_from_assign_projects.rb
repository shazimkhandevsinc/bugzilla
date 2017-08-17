class RemoveIsAdminFromAssignProjects < ActiveRecord::Migration[5.1]
  def change
    remove_column :assign_projects, :is_admin, :boolean
  end
end
