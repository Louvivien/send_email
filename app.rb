require 'bundler'
Bundler.require

<<<<<<< HEAD
$:.unshift File.expand_path("./../lib/app", __FILE__)

require 'townhalls_scrapper.rb'
Scrapper.new


=======
$LOAD_PATH.unshift File.expand_path('lib/app', __dir__)
require 'townhalls_mailer'
require 'townhalls_scraper'
require 'townhalls_adder_to_db'	
require 'townhalls_follower'



# on appelle notre classe ScrappeRegion qui va aller scraper les emails et les mettre dans un fichier JSON
ScrappeRegion.new.perform



# on appelle notre classe Mailer qui va aller envoyer des emails à partir du fichier JSON
Mailer.new.browse_json

>>>>>>> mailer
