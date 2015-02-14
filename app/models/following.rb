class Following
  include Mongoid::Document
  
  belongs_to :user, :class_name => "User", index: true
  belongs_to :followed_user, :class_name => "User", index: true
  
end