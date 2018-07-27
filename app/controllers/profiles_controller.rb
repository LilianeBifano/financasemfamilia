class ProfilesController < ApplicationController
  def show; end

  def new
    @user = User.new
  end

  def create
    @user = current_user.family.users.new(user_params)
    if @user.save
      flash[:notice] = 'Usuário Cadastrado com Sucesso!'
      redirect_to profile_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Usuário atualizada com sucesso'
      redirect_to profile_path
    else
      flash[:alert] = 'Campos em branco'
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
