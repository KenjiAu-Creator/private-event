class SessionsController < ApplicationController
  include SessionsHelper

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if !user.nil?
      log_in user
      redirect_to user
    else
      flash.now[:danger] = "Invalid Username."
      render 'new'
    end
  end

  def login
  end

  def welcome
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
