class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      session_params[:username],
      session_params[:password]
    )

    if user
      login(user)
      redirect_to goals_url
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end
