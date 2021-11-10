class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:admin, :users], notice: 'User created!'
    else
      render :new
    end
  end 

  private

  def user_params
    params.require(:product).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :password_confirmation,
    )
  end
end
