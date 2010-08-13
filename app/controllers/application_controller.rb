class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :boards
  def boards
    @boards ||= Board.all
  end
  
end
