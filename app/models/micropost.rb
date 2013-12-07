class Micropost < ActiveRecord::Base
<<<<<<< HEAD
  attr_accessible :content, :title  
  attr_accessible :group_name, :group_id 
  belongs_to :user
  belongs_to :group
=======
  attr_accessible :content  
  attr_accessible :groupid  
  belongs_to :user
  has_many :relationships, foreign_key: "groupid";
 
>>>>>>> fee860efb27c8a9a1fc4bca633ae53b0f53030c3
  
  validates :user_id, presence: true
  validates :content, presence: true
  
  default_scope order: 'microposts.created_at DESC'
  
<<<<<<< HEAD
  def self.from_current_group_joined_by(user)
   
    current_group_id=user.current_group
    current_user_id=user.id
    where("group_id IN (#{current_group_id}) AND user_id IN (#{current_user_id})  ")
  end
=======
  def self.from_groups_chosen_by(user)
    users = "select microposts.id FROM microposts join relationships on relationships.groupid = microposts.groupid WHERE relationships.userid = :user_id"
    where("id IN (#{users}) OR user_id = :user_id", {user_id: user.id})  
  end
  
  def self.allmicroposts
    users = "select id FROM microposts"
    where("id IN (#{users})")  
  end
  
>>>>>>> fee860efb27c8a9a1fc4bca633ae53b0f53030c3
end
