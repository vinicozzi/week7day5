class SessionsController < ApplicationController
    before_action :require_signed_in, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      sign_in!(@user)
      redirect_to users_url
    else
      @user = User.new(
        username: params[:user][:username],
        password: params[:user][:password]
      )
      flash.now[:errors] = ['Invalid username or password']
      render :new
    end
  end

  def destroy
    sign_out!
    redirect_to new_session_url
  end
  
end
