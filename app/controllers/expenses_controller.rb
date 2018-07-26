class ExpensesController < ApplicationController
  before_action :authenticate_user!, only: %i[new show create]
  def show
    @expense = Expense.find(params[:id])
  end

  def new
    @expense = Expense.new
    @expense_types = ExpenseType::ALL
  end

  def create
    @expense = Expense.new(expense_params)
    @expense_types = ExpenseType::ALL
    if @expense.save
      flash[:notice] = 'Saída de recursos cadastrada com sucesso!'
      redirect_to expense_path(@expense)
    else
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:date, :expense_type, :description, :value)
  end
end
