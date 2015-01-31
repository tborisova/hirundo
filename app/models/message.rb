class Message
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :content, type: String, limit: 140
  field :place_of_publishing, type: String, limit: 30
  belongs_to :user
end
