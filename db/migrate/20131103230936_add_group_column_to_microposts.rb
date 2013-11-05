class AddGroupColumnToMicroposts < ActiveRecord::Migration
  def change
     add_column :microposts, :groupid, integer
  end
end
