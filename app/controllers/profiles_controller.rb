class ProfilesController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def create
    @user = current_user.family.users.new(user_params)
    if @user.save
      flash[:notice] = 'Usuário Cadastrado com Sucesso!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
