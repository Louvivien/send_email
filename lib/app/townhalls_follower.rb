require "twitter"
require "dotenv"
require 'csv'
Dotenv.load

class AddToDb
	def initialize

	end

	def instance_twitter
		@twitter_instance = Twitter::REST::Client.new do |config|
			config.consumer_key  		= ENV['TWITTER_API_KEY']
			config.consumer_secret 		= ENV['TWITTER_API_SECRET']
			config.access_token 		= ENV['TWITTER_ACCESS_TOKEN']
			config.access_token_secret 	= ENV['TWITTER_ACCESS_SECRET']
		end
 	end

	def find_name_townhall
		@name_town =
	end

	def find_user
		@handle = []

		@name_town.each do |town|
			search_id = @twitter_instance.user_search("Mairie #{town}")
			user_id = search_id[0].screen_name
			#@twitter_instance.follow user_id
			@handle.push "@#{user_id}"
		end
		puts @handle
	end


	def perform
		instance_twitter

		find_name_townhall

		find_user

	end
end	

AddToDb.new.perform