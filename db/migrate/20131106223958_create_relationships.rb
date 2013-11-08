class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :joiner_id
      t.integer :joined_id

      t.timestamps
    end
    
    add_index :relationships, :joiner_id # user
    add_index :relationships, :joined_id # grouop
    add_index :relationships, [:joiner_id, :joined_id], unique: true
  end
end
