class AddCreatorToProjects < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :creator, :integer
  end
end
