

require 'gmail'
require 'mail'
require 'csv'
require 'dotenv'

Dotenv.load



class Mailer

gmail = Gmail.connect(ENV["GMAIL_ID"], ENV["GMAIL_PASS"])
#gmail = Gmail.connect(ENV["emaill"],ENV["mdp"])
# play with your gmail...

# Mail.deliver do
#   from     'vivien.richaud@gmail.com'
#   to       'vivien.richaud@gmail.com'
#   subject  'Here is the image you wanted'
#   body     'Here is the image you wanted'
# end


 # gmail.deliver do
 # to "vivien.richaud@gmail.com" 
 # subject "hello"
 # body "test"
 #    	end

CSV.foreach('./db/townhalls.csv', :headers => true) do |row|
  commune = row['commune'].capitalize # prints 1 the 1st time, "blah" 2nd time, etc
  email = row['email'].capitalize # prints 2 the first time, 7 the 2nd time, etc
	
gmail.deliver do
  to "#{email}"

#reprendre la colonne B2 du fichier csv

  subject "Le projet THP propose d'apprendre à vos administrés d'apprendre gratuitement à programmer !"

#toujours le meme

    content_type 'text/html; charset=UTF-8'
    body "<p>Bonjour, <br><br>
Je m'appelle Patricia Laroche, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des emails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.<br><br>

Déjà 500 personnes sont passées par <a href='https://www.thehackingproject.org/' target='_blank'>The Hacking Project</a>. Est-ce que la mairie de #{commune} veut changer le monde avec nous ?<br><br>


Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
  
  end



	end

  

gmail.logout

end