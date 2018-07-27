class HomeController < ApplicationController
  def index
    if user_signed_in?
    @chart_data = {}
    family_users = current_user.family.users
    ExpenseType::ALL.each do |type|
      expenses = Expense.where(expense_type: type, user: family_users)
      @chart_data[type] = expenses.sum(:value).to_i
    end
    @chart_data2 = {}
    RevenueType::ALL.each do |type|
      revenues = Revenue.where(revenue_type: type, user: family_users)
      @chart_data2[type] = revenues.sum(:value).to_i
    end
  end
  end
end
