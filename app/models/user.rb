class User < ApplicationRecord
  validates_uniqueness_of :username

  scope :present, -> { where(present: true) }
end
