class User < ApplicationRecord
  validates_uniqueness_of :username

  scope :present, -> { where(present: true) }

  has_one :viewport, class_name: "Pane"
  has_many :panes
end
