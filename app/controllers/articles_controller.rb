class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
	@article = Article.find(params[:id])
	@comment = Comment.new
	@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.create(article_params)
		redirect_to article_path(@article)

		flash.notice = "Article '#{@article.title}' has been created!"
	end
	
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path

		flash.notice = "Article '#{@article.title}' has been destroyed successfully!"
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
	  @article = Article.find(params[:id])
	  @article.update(article_params)

	  flash.notice = "Article '#{@article.title}' updated!"

	  redirect_to article_path(@article)
	end

	def article_params
		params.require("article").permit("title", "body")
	end

end
