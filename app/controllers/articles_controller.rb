class ArticlesController < ApplicationController
def index
@articles = Article.all
end
def show
@article = Article.find(params[:id])
@comment = Comment.new
end
def new
@article = Article.new
end
def edit
@article = Article.find(params[:id])
end
def destroy
@article = Article.find(params[:id])
if @article.destroy
redirect_to articles_path, :notice => "Deleted"
else
redirect_to articles_path, :error => "Failed to Delete"
end
end
def create
@article = Article.new(params_Article)
if @article.save
redirect_to articles_path, :notice => "Created"
else
render "new", :error => "Failed to Create"
end
end
def update
@article = Article.find(params[:id])
if @article.update(params_Article)
redirect_to article_path(@Article), :notice => "Updated"
else
render "edit", :error => "Failed to Update"
end
end
def export_xlsx
@article = Article.find(params[:id])
respond_to do |format|
format.xlsx
end
end
def import_xlsx
Article.import(params[:file])
redirect_to Articles_path, notice: "Imported"
end
def import
end
private
def params_Article
params.require(:article).permit(:title, :content)
end
end