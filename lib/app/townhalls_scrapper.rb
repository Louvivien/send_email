require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

@url_start = 'http://annuaire-des-mairies.com'

def get_the_email_of_a_townhal_from_its_webpage(url)
  page = Nokogiri::HTML(open(url))
  town_hall = page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  puts "l'adresse mail sur la page #{url} est #{town_hall}"
end

get_the_email_of_a_townhal_from_its_webpage('http://annuaire-des-mairies.com/95/andilly.html')




def get_all_the_urls_of_val_doise_townhalls
  @array_link = []

  page = Nokogiri::HTML(open('http://www.annuaire-des-mairies.com/alpes-maritimes.html'))
  links = page.css('a').select { |link| link['class'] == 'lientxt' }
 # binding.pry
  links.each { |link| @array_link.push @url_start + link['href'].delete_prefix(".")}
  print "L'ensemble des liens présents sur http://annuaire-des-mairies.com/val-d-oise.html sont #{ @array_link}"

end

get_all_the_urls_of_val_doise_townhalls


	
def perform
	@array_link.each do |n|
	 puts get_the_email_of_a_townhal_from_its_webpage(n)
	end
  end

perform


