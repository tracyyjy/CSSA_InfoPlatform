class AddCurrentGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_group, :integer, default: 1
  end
end
