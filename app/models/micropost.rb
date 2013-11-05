class Micropost < ActiveRecord::Base
  attr_accessible :content  
  attr_accessible :groupid  
  belongs_to :user
  has_many :relationships, foreign_key: "groupid";
 
  
  validates :user_id, presence: true
  validates :content, presence: true
  
  default_scope order: 'microposts.created_at DESC'
  
  def self.from_groups_chosen_by(user)
    users = "select microposts.id FROM microposts join relationships on relationships.groupid = microposts.groupid WHERE relationships.userid = :user_id"
    where("id IN (#{users}) OR user_id = :user_id", {user_id: user.id})  
  end
  
end
