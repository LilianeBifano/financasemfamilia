class Family < ApplicationRecord
  has_many :users, dependent: :destroy
end