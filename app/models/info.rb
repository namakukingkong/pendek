class Info < ActiveRecord::Base
  serialize :raw
  belongs_to :urls

  def location
    loc  = Geokit::Geocoders::MultiGeocoder.geocode(self.raw[:ip])
    {country: loc.country_code, state: loc.state, sity: loc.city}
  end
  def browser_name
    browser = Browser.new(:ua => self.raw[:ua])
    browser.name
  end
  def browser_platform
    browser = Browser.new(:ua => self.raw[:ua])
    browser.platform
  end
end
