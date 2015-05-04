class ReportingController < ApplicationController

  # Assuming the time period for the dashboard is 24 hours. 
  def home
    @referrer_pages = Event.where(type: 'page', 'properties.path' => '/pricing', 'properties.referrer' => 'https://example.com', timestamp: {'$gte' => 24.hours.ago,'$lt' => Time.now})
    @purchases = Event.where(type: 'track', event: 'Purchased an Item', 'properties.revenue_in_cents' => 3995, timestamp: {'$gte' => 24.hours.ago,'$lt' => Time.now})
    @logged_in_customers = Event.where(type: 'identify', timestamp: {'$gte' => 24.hours.ago,'$lt' => Time.now})
  end

  # Next steps would be to...

  # * build a query interface for type of query in HMTL
  # * include dropdown for every possible page and referrer (or at least major pages/referrers)
  # * use either a Jquery plugin or a simple angular app for a date/time picker
  
end