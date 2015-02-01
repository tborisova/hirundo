class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, type: String #, size: 140
  field :place_of_publishing, type: String #, size: 30
  belongs_to :user

  scope :owned, -> (user_id) { where(user_id: user_id) }
end
