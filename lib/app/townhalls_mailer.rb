require 'json'
require 'gmail'
require 'rubygems'
require 'mail'
require 'dotenv'

Dotenv.load

class Mailer
  # cette méthode envoie les mails avec pour entrée deux élements les mails et les names
  def send_mails(mail, name)
    adresse = mail

    gmail = Gmail.connect('patti.lala4@gmail.com', 'rubythpgmail')
    gmail.deliver do
      to adresse
      subject "Le projet THP propose d'apprendre à vos administrés d'apprendre gratuitement à programmer !"
      content_type 'text/html; charset=UTF-8'
      body "<p>Bonjour, <br><br>
  Je m'appelle Patricia Laroche, je suis élève à The Hacking Project, une formation au code gratuite, sans locaux, sans sélection, sans restriction géographique. La pédagogie de notre école est celle du peer-learning, où nous travaillons par petits groupes sur des projets concrets qui font apprendre le code. Le projet du jour est d'envoyer (avec du codage) des mails aux mairies pour qu'ils nous aident à faire de The Hacking Project un nouveau format d'éducation pour tous.<br><br>
  Déjà 500 personnes sont passées par <a href='https://www.thehackingproject.org/' target='_blank'>The Hacking Project</a>. Est-ce que la mairie de #{name} veut changer le monde avec nous ?<br><br>
  Charles, co-fondateur de The Hacking Project pourra répondre à toutes vos questions : 06.95.46.60.80</p>"
    end
    gmail.logout
    end

  # cette methode parcourt le json
  def browse_json
    file = File.read('./db/townhalls.json')
    datas = JSON.parse(file)

    # elle fait une boucle dnas le fichier json pour sortir deux eléments, les mails et les names
    (0...datas.length).each do |i|
      send_mails(datas[i]['mail'], datas[i]['name'])
      puts datas[i]['name']
      puts datas[i]['mail']
    end
  end
end
