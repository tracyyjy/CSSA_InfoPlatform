class CreateMicroposts < ActiveRecord::Migration
  def change
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
<<<<<<< HEAD
    add_index :microposts, [:user_id, :created_at]
=======
    add_index: :microposts, [:user_id, :created_at]
>>>>>>> fee860efb27c8a9a1fc4bca633ae53b0f53030c3
  end
end
