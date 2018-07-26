class Family < ApplicationRecord
  has_many :users, dependent: :destroy

  validates :name, :guest_total, :cep, :target, presence: true
  validates :name, :guest_total, :cep, :target, :target_value, absence: true

  validates :target_value, presence: true, numericality: true, format: { with: /\A\d+(?:\.\d{2})?\z/ }

  validates :guest_total, numericality: { only_integer: true }
end
