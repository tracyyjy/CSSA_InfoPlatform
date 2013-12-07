class AddGroupColumnToMicroposts < ActiveRecord::Migration
  def change
     add_column :microposts, :group_id, :integer
     add_column :microposts, :group_name, :string
  end
end
