require 'sinatra'

client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])

get '/' do
  "Hello #{client.user}"
end
