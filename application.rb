require 'sinatra'
require 'octokit'
require 'pry'
require 'json'

client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])

get '/' do
  logger.info "test"
  "Hello #{client.user}"
end

post '/' do
  logger.info params.to_json
  if params[:action] == "labeled" 
  end 
end
