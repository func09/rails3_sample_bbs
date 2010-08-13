class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @forums = @board.forums.desc(:updated_at)
  end

end
