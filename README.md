-send_email
Projet Vendredi
la partie d'introduction qui présente l'équipe, explique en un paragraphe les grandes lignes du programme, puis comment l'utiliser ($ bundle install)


L'équipe :

Alexis REAUD
Louis MARTIN du NORD
Cyril AVRONSART
Florian PINTO
Vivien RICHAUD
Priscille de la TOUR
Le programme Send_email permet

de collecter les noms des villes et les emails des mairies des départements Hautes-Alpes (05), Alpes-de-Haute-Provence (04) et de DEPARTEMENT NO 3, et de les stocker dans un tableur (.csv).
de collecter les handles twitter de ces mairies grâce à un bot twitter et de les stocker dans une troisième colonne du même tableur.
de suivre les mairies sur twitter
d'envoyer un email à chaque adresse email de mairie (extraite du tableur) à partir d'un compte Gmail
une partie qui explique l'arborescence du dossier, et l'utilité de tous les programmes

Arborescence du dossier:

-ultimate_townhall 
├── .gitignore (par definition pas sur github ;) ) 
├── .env (pas sur github) ├── README.md 
├── Gemfile ├── Gemfile.lock 
├── app.rb ├── db │ └── townhalls.csv 
                    └── lib 
           ├── app │ ├── townhalls_scrapper.rb │ 
                     ├── townhalls_mailer.rb │ 
                     ├── townhalls_adder_to_db.rb │ 
                     └── townhalls_follower.rb 
           └── views ├── done.rb 
                     └── index.rb

une partie qui dit comment se servir du programme, et quelles sont les gems utilisées

Comment se servir du programme:

Le programme est créé en Ruby 2.5.1 (il est donc recommandé d'utiliser une version de Ruby 2.5.1 ou plus)

Run bundle install pour installer les gems requises

Run app.rb

Les gems utilisées sont:

gem 'highline', '>= 1.5.1', group: :test
gem 'google_drive'
gem 'json'
gem 'rake', '< 11.0'
gem 'rspec', '~> 3.4'
gem 'rubocop', '~> 0.57.2'
gem 'pry'
gem 'dotenv'
gem 'nokogiri'
gem 'google-api-client'

twitter
une partie qui explique ce qui a été fait : l'email envoyé, le nombre de mairies touchées, le handle Twitter qui a été utilisé
