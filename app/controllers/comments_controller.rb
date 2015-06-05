class CommentsController < ApplicationController
def create
@comment = Comment.new(param_comment)
@article = Article.find(@comment.article_id)
if @comment.save
redirect_to article_path(@article), :notice => "New comment created"
else
redirect_to article_path(@article), :notice => "New comment failed to create"
end
end
private
def param_comment
params.require(:comment).permit(:title, :content, :article_id)
end
end