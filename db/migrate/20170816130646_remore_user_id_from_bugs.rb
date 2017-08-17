class RemoreUserIdFromBugs < ActiveRecord::Migration[5.1]
  def change
    remove_column(:bugs, :user_id)
  end
end
