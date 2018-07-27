class ExpensesController < ApplicationController
  before_action :authenticate_user!, only: %i[new show create]
  def show; end

  def new
    @expense = Expense.new
    @expense_types = ExpenseType::ALL
  end

  def create
    @expense = current_user.expenses.new(expense_params)
    @expense_types = ExpenseType::ALL
    if @expense.save
      flash[:notice] = 'Saída de recursos cadastrada com sucesso!'
      redirect_to cash_flow_path(date: @expense.date.beginning_of_month)
    else
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:date, :expense_type, :description, :value)
  end
end
