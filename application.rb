require 'sinatra'
require 'octokit'
require 'pry'
require 'json'

module Octokit
  class Client

    module Issues
      def update_issue_milestone(repo, number, milestone)
        patch "#{Repository.path repo}/issues/#{number}", {:milestone => milestone}
      end
    end
  end
end
   



client = Octokit::Client.new(:access_token => ENV['GITHUB_TOKEN'])

get '/' do
  "Awesome Github Labeler"
end

post '/' do
  if params["payload"]
    payload = JSON.parse(params["payload"])
    if payload["action"] == "labeled"
	  issue = payload["issue"]["number"]
	  label = payload["label"]["name"]
	  if ["refactoring", "bug"].include? label
		client.add_labels_to_an_issue("fairmondo/fairmondo",issue,["ready"])
		client.update_issue_milestone("fairmondo/fairmondo",issue,15)
	  end
    elsif payload["action"] == "opened"
	  issue = payload["issue"]["number"]
	  user = payload["issue"]["user"]["login"] 
	  if user != "annakress"
	    client.update_issue_milestone("fairmondo/fairmondo",issue,15)
	  end
	end
  end 
end
