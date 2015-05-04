class Traits
  include Mongoid::Document
  field :email, type: String
  field :name, type: String
  field :subscriptionPlan, type: String
  field :friendCount, type: Integer
end
