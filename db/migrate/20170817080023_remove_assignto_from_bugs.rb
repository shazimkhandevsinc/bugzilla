class RemoveAssigntoFromBugs < ActiveRecord::Migration[5.1]
  def change
    remove_column :bugs, :assignto, :integer
    add_column :bugs, :assign_to, :string
  end
end
