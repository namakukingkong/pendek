class Url < ActiveRecord::Base
  serialize :infos
  validates :origin, presence:  true
  validates :origin, :uniqueness => true
  before_create :compile
  before_validation :format_origin

  def compile
    self.short = Digest::SHA1.hexdigest([self.origin, rand].join)[1..5]
  end
  def location
    loc  = Geokit::Geocoders::MultiGeocoder.geocode(self.infos[:ip])
    {country: loc.country_code, state: loc.state, sity: loc.city}
  end
  def browser_name
    browser = Browser.new(:ua => self.infos[:ua])
    browser.name
  end
  def browser_platform
    browser = Browser.new(:ua => self.infos[:ua])
    browser.platform
  end

  def format_origin
    unless self.origin.blank?
      self.origin.slice!(/http:\/\/|https:\/\//)
      self.origin = "http://#{self.origin}"
    end
  end
end
