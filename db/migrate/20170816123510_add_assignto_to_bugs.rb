class AddAssigntoToBugs < ActiveRecord::Migration[5.1]
  def change
    add_column :bugs, :assignto, :integer
  end
end
