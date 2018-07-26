class Family < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, :guest_total, :cep, :target_value, :target, presence: true

  validates :target_value,
            numericality: {
              greater_than: 0,
              allow_blank: false
            }

  validates :guest_total, numericality: { only_integer: true }
end
