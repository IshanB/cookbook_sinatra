class View
  def display(recipes)
    if recipes == []
      puts "No recipes in your list! Add a recipe with 2."
    else
      recipes.each_with_index do |recipe, index|
        marked = recipe.done? ? "X" : " "
        puts "#{index + 1} - [#{marked}] #{recipe.name} – #{recipe.description} (#{recipe.preptime} – #{recipe.difficulty})"
      end
    end
  end

  def ask_for_recipe_name
    puts "Please enter a new recipe"
    print "> "
    gets.chomp
  end

  def ask_for_recipe_description
    puts "Please enter the recipe's description"
    print "> "
    gets.chomp
  end

  def select_recipe_to_mark
    puts "What recipe is done? (Enter index)"
    print "> "
    gets.chomp
  end

  def ask_import
    puts "What ingredient would you like a recipe for?"
    print "> "
    gets.chomp
  end

  def ask_difficulty_import
    puts "What difficulty of recipe? (Type 'Very easy', 'Easy', 'Moderate', 'Difficult' or press Enter to pass this question)"
    print "> "
    gets.chomp.capitalize
  end

  def importing(ingredient)
    puts "..."
    puts "Looking for '#{ingredient}' on LetsCookFrench..."
    puts "..."
  end

  def show_data(array)
    array[0..4].each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe[0]} (#{recipe[2]} – #{recipe[3]})"
    end
    puts "..."
    puts "Imported the 5 first results!"
    puts "..."
  end

  def select_import
    puts "Which recipe would you like to import? (enter index)"
    print "> "
    gets.chomp
  end

  def ask_index_to_remove
    puts "Please enter the recipe # you with to delete."
    print "> "
    gets.chomp
  end
end
