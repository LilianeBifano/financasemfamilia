class CashFlowsController < ApplicationController

  def index
    @date = Date.parse params[:date]
    @cfs = []
    (@date.beginning_of_month..@date.end_of_month).each do |day|
      cf = CashFlow.new(day)
      @cfs << cf
    end
  end

end