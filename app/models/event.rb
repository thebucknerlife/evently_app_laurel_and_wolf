class Event
  include Mongoid::Document
  field :version, type: Integer
  field :type, type: String
  field :userId, type: String
  field :timestamp, type: DateTime

  embeds_one :traits
  embeds_one :properties
end
