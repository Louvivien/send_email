require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'json'


class ScrappeRegion

  def initialize
    @url_start = 'http://annuaire-des-mairies.com' 
  end

    def get_the_info(url)

    page = Nokogiri::HTML(open(url)) #récupere les éléments sur chacune des pages
     @town_hall = page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
     @town_name = page.css('/html/body/div/main/section[2]/div/table/tbody/tr[1]/td[1]').text.delete_prefix('Adresse mairie de ')
     @departement_name = page.css('/html/body/div/main/section[4]/div/table/tbody/tr[1]/td[2]').text
     
    end


    def get_all_the_urls(url1)
     @array_link = []
     page = Nokogiri::HTML(open(url1))  
     links = page.css('a').select { |link| link['class'] == 'lientxt' } #récupere les Urls
     links.each { |link| @array_link.push @url_start + link['href'].delete_prefix('.') } #Mets les Urls au format http://annuaire-des-mairies.com 

    end



    def perform

    haut_aples = Hash.new
    $general = []


   get_all_the_urls('http://annuaire-des-mairies.com/hautes-alpes.html')

     @array_link.each do |n| #Récupere chacun des éléments de hautes-alpes et les ranges dans un Hash
       get_the_info(n)
       haut_aples = {mail: @town_hall, name: @town_name, departement: @departement_name}
       $general.push(haut_aples)
     end

       haute_provence = Hash.new

      get_all_the_urls('http://annuaire-des-mairies.com/alpes-de-haute-provence.html')
      @array_link.each do |n| #Récupere chacun des éléments de alpes-de-haute-provence et les ranges dans un Hash
       get_the_info(n)
       haute_provence = {mail: @town_hall, name: @town_name, departement: @departement_name}
       $general.push(haute_provence) #et les ranges 
     end

     lot_garonne = Hash.new

      get_all_the_urls('http://annuaire-des-mairies.com/lot-et-garonne.html')
      @array_link.each do |n| #Récupere chacun des éléments de lot-et-garonne et les ranges dans un Hash
       get_the_info(n)
       lot_garonne = {mail: @town_hall, name: @town_name, departement: @departement_name}
       $general.push(lot_garonne)
     end

    puts $general

    
fJson = File.open("../../db/townhalls.json", "w+") #Chemin vers le fichier Json
fJson.write($general.to_json) #Écrit le contenu de l'array general dans le fichier Json
fJson.close

  end
 
end

bisou = ScrappeRegion.new.perform