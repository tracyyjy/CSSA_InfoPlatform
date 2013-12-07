class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :groupid

      t.timestamps
    end
    
    add_index: :relationships, :groupid
  end
end
