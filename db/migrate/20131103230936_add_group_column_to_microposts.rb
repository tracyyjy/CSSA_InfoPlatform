class AddGroupColumnToMicroposts < ActiveRecord::Migration
  def change
<<<<<<< HEAD
     add_column :microposts, :group_id, :integer
     add_column :microposts, :group_name, :string
=======
     add_column :microposts, :groupid, integer
>>>>>>> fee860efb27c8a9a1fc4bca633ae53b0f53030c3
  end
end
