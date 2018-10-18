# send_email-Projet Vendredi

la partie d'introduction qui présente l'équipe, explique en un paragraphe les grandes lignes du programme, puis comment l'utiliser ($ bundle install)


## L'équipe :

Alexis REAUD
Louis MARTIN du NORD
Cyril AVRONSART
Florian PINTO
Vivien RICHAUD
Priscille de la TOUR



## Le programme Send_email permet

de collecter les noms des villes et les emails des mairies des départements Hautes-Alpes (05), Alpes-de-Haute-Provence (04) et de lot-et-garonne et de les stocker dans un fichier JSON
de collecter les handles twitter de ces mairies grâce à un bot twitter et de les stocker dans une troisième colonne du même tableur.
de suivre les mairies sur twitter
d'envoyer un email à chaque adresse email de mairie (extraite du tableur) à partir d'un compte Gmail
une partie qui explique l'arborescence du dossier, et l'utilité de tous les programmes

## Arborescence du dossier:

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

## Comment se servir du programme:

Le programme est créé en Ruby 2.5.1 (il est donc recommandé d'utiliser une version de Ruby 2.5.1 ou plus)

Run bundle install pour installer les gems requises

Run app.rb

## Les gems utilisées sont:

gem 'highline'
gem 'google_drive'
gem 'json'
gem 'rake'
gem 'rspec'
gem 'rubocop'
gem 'pry'
gem 'dotenv'
gem 'nokogiri'
gem 'google-api-client'

### townhalls_scrapper.rb
Ce fichier récupère les adresses mail des Mairie à partir du site http://www.annuaire-des-mairies.com et les implémentes dans un fichier Json

### twitter
Ce fichier récupère le nom des mairies à partir du fichier JSON et y ajoute le handle twitter de la mairie
une partie qui explique ce qui a été fait : l'email envoyé, le nombre de mairies touchées, le handle Twitter qui a été utilisé

### townhalls_mailer.rb 
Récupere toutes les mails des mairies à partir du fichier JSON et leur envoie un mail faisant la publicité de THP
# send_email
