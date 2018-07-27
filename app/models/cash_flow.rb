class CashFlow
  attr_accessor :date, :expense_value, :revenue_value,
                :expense_type, :revenue_type

  def initialize(date)
    @date = date
    @expense_type = ''
    @revenue_type = ''

    expenses = Expense.where(date: date)
    revenues = Revenue.where(date: date)

    revenues_item(revenues)
    expenses_item(expenses)
    @revenue_value = revenues.sum(:value)
    @expense_value = expenses.sum(:value)
  end

  def revenues_item(revenues)
    revenues.each do |r|
      @revenue_type = "#{@revenue_type} | #{r.revenue_type} "
    end
  end

  def expenses_item(expenses)
    expenses.each do |e|
      @expense_type = "#{@expense_type} | #{e.expense_type} "
    end
  end

  def self.calculate_revenue_amount(cash_flows = [])
    cash_flows.map { |flow| flow.revenue_value.to_i }.sum
    # cash_flows.map(&:revenue_value.to_i).sum
  end

  def self.calculate_expense_amount(cash_flows = [])
    cash_flows.map { |flow| flow.expense_value.to_i }.sum
    # cash_flows.map(&:revenue_value.to_i).sum
  end
end
