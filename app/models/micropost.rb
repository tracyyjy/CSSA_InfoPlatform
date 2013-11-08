class Micropost < ActiveRecord::Base
  attr_accessible :content  
  attr_accessible :group_name, :group_id 
  belongs_to :user
  belongs_to :group
  
  validates :user_id, presence: true
  validates :content, presence: true
  
  default_scope order: 'microposts.created_at DESC'
  
end
