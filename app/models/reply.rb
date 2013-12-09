class Reply < ActiveRecord::Base
  attr_accessible :content, :micropost_id, :user_id
  # attr_accessible :content 
  #  for security reason
  belongs_to :user
  belongs_to :micropost
  # micropost.replies
  # validates :user_id, presence: true
  # validate :micropost_id, presence: true
  
  default_scope order: 'replies.created_at DESC'
  
end
