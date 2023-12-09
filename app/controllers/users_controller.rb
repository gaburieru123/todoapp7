class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @tasks = @user.tasks.page(params[:page]).per(5).reverse_order
  end

  def destroy
    user = User.find(params[:id])
    binding.b
    if user.id == current_user.id && user.destroy
      flash[:notice] = "アカウント削除に成功しました"
      redirect_to new_user_registration_path
    else
      flash[:notice] = "無効な操作です。アカウント削除はできません。"
      redirect_to user_path
    end
  end

end
