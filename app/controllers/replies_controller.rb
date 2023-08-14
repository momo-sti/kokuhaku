class RepliesController < ApplicationController
  def show
    @reply = Reply.find(params[:id])
  end
end
