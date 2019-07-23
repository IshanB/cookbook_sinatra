require 'csv'
require_relative 'recipe.rb'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    # stocker toutes les recettes
    @csv_file_path = csv_file_path
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_to_csv
  end

  def update_recipe(recipe_index)
    @recipes[recipe_index].done = true
    save_to_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_to_csv
  end

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(row[0], row[1], row[2], row[3])
    end
  end

  def save_to_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.preptime, recipe.difficulty, recipe.done?]
      end
    end
  end
end


# Implement the recipes class with 4 methods:

# initialize(csv_file_path) which loads existing Recipe from the CSV
# all which returns all the recipes
# add_recipe(recipe) which adds a new recipe to the recipes
# remove_recipe(recipe_index) which removes a recipe from the recipes.
