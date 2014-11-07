require 'sinatra'
require 'octokit'
require 'pry'
require 'json'

client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])

get '/' do
  logger.info "test"
  binding.pry
  "Hello #{client.user}"
end

post '/' do
  if params["payload"]
    payload = JSON.parse(params["payload"])
    if payload["action"] == "labeled"
	  issue = payload["issue"]["number"]
	  label = payload["label"]["name"]
	  if ["refactoring", "bug"].include? label
		client.add_labels_to_an_issue("fairmondo/fairmondo",issue,["ready"])
	  end
    end
  end 
end
