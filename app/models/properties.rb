class Properties
  include Mongoid::Document
  field :url, type: String
  field :title, type: String
  field :path, type: String
  field :referrer, type: String
  field :shippingMethod, type: String
  field :revenue, type: String
  field :revenue_in_cents, type: Integer
end