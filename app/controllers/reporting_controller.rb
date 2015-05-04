class ReportingController < ApplicationController

  def home
    @referrer_pages = Event.where(type: 'page', 'properties.path' => '/pricing', 'properties.referrer' => 'https://example.com', timestamp: {'$gte' => 24.hours.ago,'$lt' => Time.now})
    @purchases = Event.where(type: 'track', event: 'Purchased an Item', 'properties.revenue_in_cents' => 3995, timestamp: {'$gte' => 24.hours.ago,'$lt' => Time.now})
    @logged_in_customers = Event.where(type: 'identify', timestamp: {'$gte' => 24.hours.ago,'$lt' => Time.now})
  end
  
end