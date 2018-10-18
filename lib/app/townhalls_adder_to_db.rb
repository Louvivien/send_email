require "twitter"
require "dotenv"

class AddToDb
	def initialize

	end

	def instance_twitter
		rester = Twitter::REST::Client.new do |config|
	config.consumer_key  		= ENV['TWITTER_API_KEY']
	config.consumer_secret 		= ENV['TWITTER_API_SECRET']
	config.access_token 		= ENV['TWITTER_ACCESS_TOKEN']
	config.access_token_secret 	= ENV['TWITTER_ACCESS_SECRET']
 end
		
	end

	def find_name_townhall
		
	end
end	