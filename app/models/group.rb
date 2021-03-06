class Group < ActiveRecord::Base
  attr_accessible :group_description, :group_name
  
  has_many :microposts, dependent: :destroy # how to deal with these??? to check delete user/group will delete the post as well
  has_many :reverse_relationships, foreign_key: "joined_id",
                                    class_name: "Relationship",
                                    dependent: :destroy
                                    
  has_many :users, through: :reverse_relationships, source: :joiner #!
  
  
  validates :group_description, presence: true, length: {maximum: 200}
  validates :group_name, presence: true, length: {maximum: 50}, uniqueness: {case_sensitive:false}
end
