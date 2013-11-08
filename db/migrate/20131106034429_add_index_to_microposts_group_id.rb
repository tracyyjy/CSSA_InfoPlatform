class AddIndexToMicropostsGroupId < ActiveRecord::Migration
  def change
    add_index :microposts, [:group_id, :created_at]
  end
end
