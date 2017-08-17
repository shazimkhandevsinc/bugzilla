class AddCreatedByToBugs < ActiveRecord::Migration[5.1]
  def change
    add_column :bugs, :created_by, :integer
  end
end
