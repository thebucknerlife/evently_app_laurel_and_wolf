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

# Validations would be my next step here. I'm assuming the webhooks channel is stable and the chances
# of invalid data coming through are low. But with more time I'd add some conditional validations to 
# make sure the metrics we're using are never tainted. Check that the right fields are populated depending
# on the type of Event (here and in the embedded models).