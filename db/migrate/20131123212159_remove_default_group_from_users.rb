class RemoveDefaultGroupFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :annoucement
    remove_column :users, :annoucement_email
    remove_column :users, :carpool
    remove_column :users, :carpool_email
    remove_column :users, :rent_lease
    remove_column :users, :rent_lease_email
    remove_column :users, :sale
    remove_column :users, :sale_email
  end

  def down
  end
end
