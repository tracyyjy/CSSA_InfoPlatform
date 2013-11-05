class AddUseridColumnToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :userid, :integer
  end
end
