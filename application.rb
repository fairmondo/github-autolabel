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
  logger.info params["payload"].class
  if params["payload"]
    logger.info "payload there"
    logger.info params["payload"]["action"].class
    logger.info params["payload"]["issue"]["number"]
  end 
end
