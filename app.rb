require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib/app", __FILE__)
require 'townhalls_mailer'

#on appelle notre classe mailer qui va aller envoyer des emails à partir du fichier CSV
Mailer.new