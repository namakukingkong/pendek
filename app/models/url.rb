class Url < ActiveRecord::Base
  serialize :infos
  validates :origin, presence:  true
  validates :origin, :uniqueness => true
  before_create :compile

  def compile
    self.short = Digest::SHA1.hexdigest([self.origin, rand].join)[1..5]
  end
end
