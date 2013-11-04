class Micropost < ActiveRecord::Base
  attr_accessible :content  
  attr_accessible :group  
  belongs_to :user
  belongs_to :relationship
  
  validates :user_id, presence: true
  validates :content, presence: true
  
  default_scope order: 'microposts.created_at DESC'
  
end
