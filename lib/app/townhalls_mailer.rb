require 'gmail'
require 'mail'
require 'csv'
require 'dotenv'

Dotenv.load

class Mailer
  # on se connecte à gmail avec la gem gmail et on va chercher les identifiants et mots de passe de notre coompte dans le fichier .env
  gmail = Gmail.connect(ENV['GMAIL_ID'], ENV['GMAIL_PASS'])

  # on parcours le fichier csv
  CSV.foreach('./db/townhalls.csv', headers: true) do |row|
    # pour chaque ligne on met dans une variavle la première colonne "commune" et on capitalize le mot
    commune = row['commune'].capitalize # prints 1 the 1st time, "blah" 2nd time, etc
    # pour chaque ligne on met dans une variavle la seconde colonne "commune" et on capitalize le mot
    email = row['email'].capitalize

    # a partir de notre session gmail, on envoie un mail
    gmail.deliver do
      to email.to_s
      subject "Le projet THP propose d'apprendre à vos administrés d'apprendre gratuitement à programmer !"
      content_type 'text/html; charset=UTF-8'
      body "<p>Bonjour, <br><br>
  Je m'appelle Patricia Laroche, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.<br><br>
  Déjà 500 personnes sont passées par <a href='https://www.thehackingproject.org/' target='_blank'>The Hacking Project</a>. Est-ce que la mairie de #{commune} veut changer le monde avec nous ?<br><br>
  Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
    end
  end

  gmail.logout
end
