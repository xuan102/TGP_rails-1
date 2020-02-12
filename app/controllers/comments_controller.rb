class CommentsController < ApplicationController

  def create

    @gossip = Gossip.find(params[:gossip_id])
    puts "$"*60
    puts @gossip
    puts "$"*60
    @comment = Comment.create(content: params[:content], user_id: User.first.id, gossip_id: @gossip.id)
    puts "$"*60
    puts @comment
    puts "$"*60
    if @comment.save 
      redirect_to :root
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content])
      puts params
      redirect_to :root
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to :root
    end
  end
end
