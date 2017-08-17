class CreateAssignProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :assign_projects do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true
      t.boolean :is_admin

      t.timestamps
    end
  end
end
