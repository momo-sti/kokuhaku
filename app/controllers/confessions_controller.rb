class ConfessionsController < ApplicationController
  def top
  end

  def new
    @confession = Confession.new
  end

  def create
    @confession = Confession.new(confession_params)
  
    if @confession.save
      response = OpenAi.evaluate_confession(@confession.text)
  
      # 新しいReplyモデルを作成し、保存
      @reply = Reply.new(
        confession: @confession,
        result: response[:status],
        feedback: response[:message],
        image_path: response[:image_path]
      )
  
      if @reply.save
        redirect_to reply_path(@reply)  # Replyの結果を表示するページにリダイレクト
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  private

  def confession_params
    params.require(:confession).permit(:text, :username)
  end
end
