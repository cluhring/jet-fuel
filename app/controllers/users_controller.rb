class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      authy = Authy::API.register_user(
        email: @user.email,
        cellphone: @user.phone,
        country_code: @user.country_code
      )
      @user.update(authy_id: authy.id)
      redirect_to root_path(current_user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :email,
                                 :phone,
                                 :password,
                                 :country_code,
    )
  end
end
