class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])

		if @post.comments.create(comments_params)
			redirect_to @post,
			            notice: 'Comment was sucessfully created.'
	    else
	    redirect_to @post,
	                alert: 'Error creating comment.' 		
	    end

	    private

	    def comment_params
	    	params.require(:comment).permit(:author, :body)
	    end
	end                        
end
