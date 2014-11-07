require 'sinatra'
require 'octokit'
require 'pry'

client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])

get '/' do
  binding.pry
  "Hello #{client.user}"
end

post '/' do
  
end
