class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			redirect_to :back
		else
			redirect_to :back, notice: "Error"
		end
	end
	def comment_params
		params.require(:comment).permit(:content, :commentable_id, :commentable_type, :user_id)
	end
end
