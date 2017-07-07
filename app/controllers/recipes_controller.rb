class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update]

    def index
      @recipes = Recipe.all
    end

    def show
    end

    def new
      @recipe = Recipe.new
      @ingredients = Ingredient.all
    end

    def create
      @recipe = Recipe.create(recipe_params)
      redirect_to recipe_path(@recipe)
    end

    def edit
      @ingredients = Ingredient.all
    end

    def update
      if !recipe_params[:ingredient_names]
        recipe_params[:ingredient_names] = []
      end
      @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    end

    private

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      # params.require(:recipe).permit(:name, :ingredient_names)
      params.require(:recipe).permit!
    end

end
