class SessionsController < ApplicationController
  def create
    user = User.login(params[:user])
    if user
      session[:thankyou9527] = user.id
      redirect_to root_path, notice: "登入成功"
    else
      redirect_to sign_in_users_path, alert: "帳號密碼有誤"
    end
  end
end
