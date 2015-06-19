class Url < ActiveRecord::Base
  has_many :infos
  validates :origin, presence:  true
  validates :short, presence:  true
  validates :origin, :uniqueness => true
  validates :short, :uniqueness => true
  validates_format_of :short, :with => /\A[A-Za-z0-9]*\z/
  #before_create :compile
  before_validation :format_origin

  def compile
    self.short = Digest::SHA1.hexdigest([self.origin, rand].join)[1..5]
  end
  def format_origin
    unless self.origin.blank?
      self.origin.slice!(/http:\/\/|https:\/\//)
      self.origin = "http://#{self.origin}"
    end
  end
end
