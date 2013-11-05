class Micropost < ActiveRecord::Base
  attr_accessible :content  
  attr_accessible :groupid  
  belongs_to :user
  has_many :relationships, foreign_key: "groupid";
 
  
  validates :user_id, presence: true
  validates :content, presence: true
  
  default_scope order: 'microposts.created_at DESC'
  
end
