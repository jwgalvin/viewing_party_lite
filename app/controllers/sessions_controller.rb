class SessionController < ApplicationController 
  def new 
  end 

  def create 
  end 

  def destroy 
    session.destroy
    redirect_to root_path  
  end 
  
end 