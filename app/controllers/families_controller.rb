class FamiliesController < ApplicationController
  before_action :authenticate_user!

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    if @family.save
      current_user.update(family: @family)
      flash[:notice] = 'Familia Cadastrada com Sucesso!'
      redirect_to my_family_path
    else
      render 'new'
    end
  end

  def show
    @family = current_user.family
  end

  private

  def family_params
    param = %i[name cep guest_total target target_value]
    params.require(:family).permit(param)
  end
end
