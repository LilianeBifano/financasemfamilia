class CashFlowsController < ApplicationController
  before_action :authenticate_user!, only: %i[index]
  def index
    @date = Date.parse(params[:date] || Date.today.to_s)
    @cfs = []
    (@date.beginning_of_month..@date.end_of_month).each do |day|
      cf = CashFlow.new(day)
      @cfs << cf
    end
  end

end