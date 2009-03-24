class SessionsController < ApplicationController

  skip_before_filter :find_user, :except => "destroy"
  
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_login params[:user][:login]
    if @user and @user.authorize?(params[:user][:password])
      session[:user_id] = @user.id
      flash[:notice] = t 'controllers.sessions.hello', :login => @user.login
      redirect_to games_url
    else
      flash[:error] = t 'controllers.sessions.wrong_password'
      @user.password = nil if @user
      render :action => :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "До свидания!"
    redirect_to games_url
  end
end
