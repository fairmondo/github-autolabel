require 'sinatra'
require 'octokit'
require 'pry'
require 'json'

client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])

get '/' do
  binding.pry
  "Hello #{client.user}"
end

post '/' do
  if params[:action] == "labeled" 
    logger.info params.to_json
  end 
end
