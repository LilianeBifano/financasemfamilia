class RevenuesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def new
    @revenue = Revenue.new
    @revenue_types = RevenueType::ALL
  end

  def create
    @revenue = current_user.revenues.new(revenue_params)
    @revenue_types = RevenueType::ALL
    if @revenue.save
      flash[:notice] = 'Entrada de recursos cadastrada com sucesso!'
      redirect_to cash_flow_path(date: @revenue.date.beginning_of_month)
    else
      render 'new'
    end
  end

  private

  def revenue_params
    params.require(:revenue).permit(:date, :revenue_type, :description, :value)
  end
end
