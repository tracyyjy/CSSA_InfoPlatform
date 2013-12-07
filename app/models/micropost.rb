class Micropost < ActiveRecord::Base
  attr_accessible :content, :title  
  attr_accessible :group_name, :group_id 
  belongs_to :user
  belongs_to :group
  
  validates :user_id, presence: true
  validates :content, presence: true
  
  default_scope order: 'microposts.created_at DESC'
  
  def self.from_current_group_joined_by(user)
   
    current_group_id=user.current_group
    current_user_id=user.id
    where("group_id IN (#{current_group_id}) AND user_id IN (#{current_user_id})  ")
  end
end
