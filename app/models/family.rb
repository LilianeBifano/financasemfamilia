class Family < ApplicationRecord
  has_many :users, dependent: :destroy
  validates :name, :guest_total, presence: true
end
