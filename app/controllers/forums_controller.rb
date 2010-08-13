class ForumsController < ApplicationController
  
  def show
    @forum = Forum.find(params[:id])
    @messages = @forum.messages.filterd(params[:filter])
    @new_message = Message.new
  end

  def create_message
    @forum = Forum.find(params[:id])
    @message = @forum.messages.build(params[:message])
    if @message.save
      redirect_to [@forum.board, @forum]
    end
  end

end
