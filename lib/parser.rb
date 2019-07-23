require 'nokogiri'
require 'open-uri'

class Parser
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def parse(difficulty = "")
    array = []
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?aqt=#{@ingredient}"
    doc = Nokogiri::HTML(open(url), nil, 'utf-8')
    doc.search('.m_contenu_resultat').each do |element|
      array2 = []
      recipe_difficulty = element.search('.m_detail_recette').text.gsub(/Recipe - \w+ - /, '').gsub(/ -.+/, '').strip.capitalize
      array2 << element.search('.m_titre_resultat a').text.strip.capitalize
      array2 << element.search('.m_texte_resultat').text.strip.capitalize
      array2 << element.search('.m_detail_time').text.scan(/\d+ \w+/).join(" - ")
      array2 << element.search('.m_detail_recette').text.gsub(/Recipe - \w+ - /, '').gsub(/ -.+/, '').strip.capitalize
      array << array2 if difficulty == "" || difficulty == recipe_difficulty
    end
    return array
  end
end
