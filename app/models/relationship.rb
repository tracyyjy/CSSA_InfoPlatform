class Relationship < ActiveRecord::Base
  attr_accessible :joined_id, :joiner_id
  
  belongs_to :joiner, class_name: "User"
  belongs_to :joined, class_name: "Group"
  
  validates :joiner_id, presence: true
  validates :joined_id, presence: true
  
end
