class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @forums = @board.forums.order('updated_at DESC')
  end

end
