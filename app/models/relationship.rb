class Relationship < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :joined_id, :joiner_id
  
  belongs_to :joiner, class_name: "User"
  belongs_to :joined, class_name: "Group"
  
  validates :joiner_id, presence: true
  validates :joined_id, presence: true
  
=======
  attr_accessible :groupid
  attr_accessible :userid

  belongs_to :user
  belongs_to :micropost
  
  validates :userid, presence: true
  validates :groupid, presence: true
>>>>>>> fee860efb27c8a9a1fc4bca633ae53b0f53030c3
end
