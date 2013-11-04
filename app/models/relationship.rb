class Relationship < ActiveRecord::Base
  attr_accessible :group
  has_many :microposts, foreign_key: "group";
  belongs_to :user
end
