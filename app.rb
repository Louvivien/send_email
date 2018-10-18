require 'bundler'
Bundler.require

$LOAD_PATH.unshift File.expand_path('lib/app', __dir__)
require 'townhalls_mailer'

# on appelle notre classe mailer qui va aller envoyer des emails à partir du fichier CSV
Mailer.new.browse_json
