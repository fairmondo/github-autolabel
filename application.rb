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
  if params["payload"]
    logger.info "payload there"
    logger.info JSON.parse(params["payload"])
    logger.info JSON.parse(params["payload"]).class
  end 
end
