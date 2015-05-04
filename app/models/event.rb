class Event
  include Mongoid::Document
  field :version, type: Integer
  field :type, type: String
  field :userId, type: String
  field :timestamp, type: DateTime
  field :event, type: String

  embeds_one :traits
  embeds_one :properties

  # Callback to convert revenue string into cents and save a revenue_in_cents for summing revenue. 
  # Works for both #save on new records and .create.
  #
  # Assumes that revenue would never present but blank (e.g. {revenue: ''}). Would need to 
  # to test for blankness otherwise.
  before_create do |doc|
    if doc.properties && doc.properties.revenue
      doc.properties.revenue_in_cents = (doc.properties.revenue.to_f * 100).to_i
    end
  end
end
