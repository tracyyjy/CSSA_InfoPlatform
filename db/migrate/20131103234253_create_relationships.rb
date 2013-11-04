class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :id
      t.string :group

      t.timestamps
    end
    
    add_index: relationship, :id
    add_index: relationship, :group
    add_index: relationship, [:id, :group], unique: true
  end
end
