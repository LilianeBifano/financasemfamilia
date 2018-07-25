class FamiliesController < ApplicationController
  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      flash[:notice] = 'Familia Cadastrada com Sucesso!'
      redirect_to family_path(@family)
    else
      render 'new'
    end
  end

  def show
    @family = Family.find(params[:id])
  end

  private

  def family_params
    param = %i[name cep guest_total target target_value]
    params.require(:family).permit(param)
  end
end
