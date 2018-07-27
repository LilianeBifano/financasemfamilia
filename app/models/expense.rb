class Expense < ApplicationRecord
  validates :date, :description, :expense_type, :value,
            presence: { message: 'não pode ficar em branco' }

  def self.daily_expense(query_date = Time.zone.today)
    where(date: query_date)
  end
end
