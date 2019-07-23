class Recipe
  attr_reader :name, :description, :preptime, :difficulty
  attr_writer :done

  def initialize(name, description, preptime = 'unknown preptime', difficulty = 'unknown difficulty')
    @name = name
    @description = description
    @preptime = preptime
    @difficulty = difficulty
    @done = false
  end

  def done?
    @done
  end
end
