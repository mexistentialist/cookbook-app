class RecipesController < ApplicationController

	def index
		@recipes = Recipe.all

		# if params[:sort]	
		# 	@recipes = Recipe.order(:preptime)
		# end
	end

	def new
	end

	def create
		@recipe = Recipe.create({
			title: params[:title], user_id: current_user.id, ingredients: params[:ingredients], directions: params[:directions], image: params[:image], preptime: params[:preptime]
								})
		flash[:success] = "New recipe added"

		redirect_to "/"
	end


	def show
		@recipe = Recipe.find(params[:id])
		@ingredient_list = @recipe.ingredient_list
		@directions_list = @recipe.directions_list
	end

	def edit
		@recipe = Recipe.find(params[:id])
	end

	def update
		@recipe = Recipe.find(params[:id])
		@recipe.update({title: params[:title], user_id: current_user.id, ingredients: params[:ingredients], directions: params[:directions], image: params[:image], preptime: params[:preptime]
						})

		redirect_to "/recipes/#{@recipe.id}"
	end

	def destroy
		@recipe = Recipe.find(params[:id])
		@recipe.destroy
		redirect_to "/"
		flash[:warning] = "Recipe deleted"
	end
end
