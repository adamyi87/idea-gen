class VotesController < ApplicationController
  def create
    @vote = Vote.where(:idea_id => params[:vote][:idea_id], :user_id => current_user.id).first
    if @vote
      @vote.up = params[:vote][:up]
      @vote.save
    else
      @vote = current_user.votes create(vote_params)
    end
    redirect_to :back
  end
  private
  def vote_params
    params.require(:vote).permit(:idea_id, :up)
  end
end
