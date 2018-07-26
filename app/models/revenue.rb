class Revenue < ApplicationRecord
  validates :date, :description, :revenue_type, :value,
            presence: { message: 'não pode ficar em branco' }
end
