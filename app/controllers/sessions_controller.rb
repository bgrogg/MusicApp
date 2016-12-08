class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    email, password = session_params.values
    user = User.find_by_credentials(email, password)

    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:messages] = ["Incorrect email and/or password"]
      render :new
    end

  end

  def destroy
    logout
    redirect_to new_session_url
  end


  private

  def session_params
    params.require(:user).permit(:email, :password)
  end

end
