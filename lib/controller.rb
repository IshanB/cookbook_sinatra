require_relative 'recipe.rb'
require_relative 'view.rb'
require_relative 'parser.rb'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    @view.display(@cookbook.all)
  end

  def create
    # 1. Get name and description from view
    name = @view.ask_for_recipe_name
    description = @view.ask_for_recipe_description
    # 2. Create new recipe
    recipe = Recipe.new(name, description)
    # 3. Add to cookbook
    @cookbook.add_recipe(recipe)
  end

  def import
    ingredient = @view.ask_import
    difficulty = @view.ask_difficulty_import
    @view.importing(ingredient)
    data = Parser.new(ingredient)
    array = data.parse(difficulty)
    @view.show_data(array)
    index = @view.select_import.to_i
    choice = array[index - 1]
    recipe = Recipe.new(choice[0], choice[1], choice[2], choice[3])
    @cookbook.add_recipe(recipe)
  end

  def mark_as_done
    # Ask a recipe to be marked as done by the user
    list
    index = @view.select_recipe_to_mark.to_i
    # Change the status of the recipe marked
    @cookbook.update_recipe(index - 1)
    # List the updated cookbook
    list
  end

  def destroy
    @view.display(@cookbook.all)
    index = @view.ask_index_to_remove.to_i
    @cookbook.remove_recipe(index - 1)
  end
end


