class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:user_identifier].downcase) || User.find_by_phone(params[:session][:user_identifier])
    if user
      if user.authenticate(params[:session][:password])
        sign_in user
        redirect_back_or user
      else
        flash.now[:error] = 'Invalid password'
        render 'new'
      end
    else
      flash.now[:error] = 'User not found. Check your email or phone number'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
