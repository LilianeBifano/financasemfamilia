class HomeController < ApplicationController
  def index
    @chart_data = {}
    ExpenseType::ALL.each do |type|
      expenses = Expense.where(expense_type: type)
      @chart_data[type] = expenses.sum(:value).to_i
    end
    @chart_data2 = {}
    RevenueType::ALL.each do |type|
      revenues = Revenue.where(revenue_type: type)
      @chart_data2[type] = revenues.sum(:value).to_i
    end
  end
end
