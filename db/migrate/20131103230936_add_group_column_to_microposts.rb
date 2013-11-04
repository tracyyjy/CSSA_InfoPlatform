class AddGroupColumnToMicroposts < ActiveRecord::Migration
  def change
     add_column :microposts, :group, :string
  end
end
