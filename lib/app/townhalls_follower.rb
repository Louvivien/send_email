require "twitter"
require "dotenv"
require 'json'
require 'pry'
Dotenv.load

class AddToDb
	
	def initialize
		@name_town = []
		@handle = []
		@search_id = []
	end

# Créer l'instance twitter pour et récupère les APIs
	def instance_twitter
		@twitter_instance = Twitter::REST::Client.new do |config|
			config.consumer_key  		= ENV['TWITTER_API_KEY']
			config.consumer_secret 		= ENV['TWITTER_API_SECRET']
			config.access_token 		= ENV['TWITTER_ACCESS_TOKEN']
			config.access_token_secret 	= ENV['TWITTER_ACCESS_SECRET']
		end
 	end

# Récupère les nom de ville via les hash contenue dans le fichier townhalls.json dans un array nommé "@name_town"
	def find_name_townhall
		file = File.read('./../../db/townhalls.json')
		datas = JSON.parse(file)

		(0...datas.length).each do |i|
            @name_town << datas[i]['name']
    	end
	end

# Récupère les handles twitter par un search sur notre array "@name_town" de chaque ville et on les follow
	def find_user

		@name_town.each do |town|
			@twitter_instance.search("Mairie #{town}").take(1).collect do |tweet|
				@twitter_instance.follow tweet.user.screen_name
				@handle << tweet.user.screen_name
			end
		end

	end

	def perform
		instance_twitter
		find_name_townhall
		find_user

	end
end	

AddToDb.new.perform