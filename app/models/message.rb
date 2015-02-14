class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, type: String
  field :place_of_publishing, type: String

  belongs_to :user, index: true

  validates_length_of :content, minimum: 1, maximum: 140
  validates_length_of :place_of_publishing, maximum: 30
  
  scope :owned, -> (user_id) { where(user_id: user_id) }
end
