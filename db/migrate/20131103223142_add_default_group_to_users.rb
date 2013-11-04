class AddDefaultGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :annoucement, :boolean, default: false
    add_column :users, :annoucement_email, :boolean, default: false
    add_column :users, :carpool, :boolean, default: false
    add_column :users, :carpool_email, :boolean, default: false
    add_column :users, :rent_lease, :boolean, default: false
    add_column :users, :rent_lease_email, :boolean, default: false
    add_column :users, :sale, :boolean, default: false
    add_column :users, :sale_email, :boolean, default: false
  end
end
