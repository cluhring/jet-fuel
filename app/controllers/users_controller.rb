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
      redirect_to account_path
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

# POST https://api.authy.com/protected/{FORMAT}/users/new?api_key={KEY}
# 3jHqU6es36Vy2q0Etei8st8Jb3JBlOTc
# <link href="https://www.authy.com/form.authy.min.css" media="screen" rel="stylesheet" type="text/css">
# <script src="https://www.authy.com/form.authy.min.js" type="text/javascript"></script>
