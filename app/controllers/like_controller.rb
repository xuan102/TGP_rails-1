class LikeController < ApplicationController
  before_action :authenticate_user

  def create
    @like = Like.new(user_id: current_user.id, content_type: "Gossip", content_id: params[:gossip_id])
    
    if @like.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, content_type: "Gossip", content_id: params[:gossip_id]).delete
    redirect_back(fallback_location: root_path)
  end
end
