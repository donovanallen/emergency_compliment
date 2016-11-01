require 'sinatra'
require 'sinatra/reloader'

compliments = [
  "Have you been working out?",
  "you = flame emoji",
  "You're killing it.",
  "Dude, you are too cool",
  "Hot damn, I see you ;)"
]

colors = ["#FFBF00", "#0080FF","#01DF3A","#FF0080"]

get '/' do
  @greeting = "Hi, friend!"
  @compliment = compliments.sample
  @color = colors.sample
  erb :compliment
end

get '/:name' do
  @greeting = "Hi, #{params[:name].capitalize}!"
  @compliment = compliments.sample
  @color = colors.sample
  erb :compliment
end

post '/' do
  compliments.push(params[:compliment])
  redirect '/'
end
