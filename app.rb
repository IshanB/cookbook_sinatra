require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
require_relative 'lib/cookbook.rb'
require_relative 'lib/recipe.rb'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

csv_file = File.join(__dir__, 'lib/recipes.csv')
cookbook = Cookbook.new(csv_file)

get '/' do
  @recipes = cookbook.all
  erb :index
end

# get '/recipe/:index' do
#   recipe_index = params[:index]
#   erb :index
# end

post '/new' do
  name = params[:name]
  description = params[:description]
  preptime = params[:preptime]
  difficulty = params[:difficulty]
  recipe = Recipe.new(name, description, preptime, difficulty)
  cookbook.add_recipe(recipe)
  erb :new
end

get '/recipes/:index' do
  cookbook.remove_recipe(params[:index].to_i)
  redirect to '/'
end

# get '/about' do
#   erb :about
# end

# get '/team/:username' do
#   puts params[:username]
#   "The username is #{params[:username]}"
# end
