require 'pry'
require 'dotenv'# Appelle la gem Dotenv
require 'nokogiri'
require 'open-uri'
#require 'restclient'

def get_html_from_url(url)
	return page = Nokogiri::HTML(open(url))
end

def get_html_rest(url)
	return page = Nokogiri::HTML(RestClient.get(url))	 
end

def get_list_of_links_cities_method_open(url)
        links_all_cities_array=[]
        cities_link_array=get_html_from_url(url).xpath('//html/body/table/tr[3]/td/table/tr/td[2]/table/tr/td')
        cities_link_array.css("a").map{|link| links_all_cities_array<<"http://annuaire-des-mairies.com#{link['href'][1,link['href'].length]}"}
	return links_all_cities_array
end 

def extract_emails(url)
        result=Hash.new
	city_name=""
	email_mairie=""

	get_list_of_links_cities_method_open(url).each do |html_link|
	   page = Nokogiri::HTML(open(html_link))
	   city_name=page.xpath('/html/body/div/main/section[2]/div/table/thead/tr/th[1]').text.capitalize
	  email_mairie=page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
	  result[city_name[32,city_name.length]]=email_mairie
	end
  	  return result
end

puts extract_emails("http://annuaire-des-mairies.com/val-d-oise.html")



