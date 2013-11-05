class Relationship < ActiveRecord::Base
  attr_accessible :groupid
  attr_accessible :userid

  belongs_to :user
  belongs_to :micropost
  
  validates :userid, presence: true
  validates :groupid, presence: true
end
