class PollSerializer < ActiveModel::Serializer
  attributes :id, :topic

  has_many :poll_options
  
end
