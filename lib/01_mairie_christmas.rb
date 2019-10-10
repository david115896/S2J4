require 'pry'
require 'dotenv'# Appelle la gem Dotenv
require 'nokogiri'
require 'open-uri'
#require 'restclient'

def get_list_of_links_cities_method_open(url)
	links_all_cities_array=[]
	page = Nokogiri::HTML(open(url))
	cities_link_array=page.xpath('//html/body/table/tr[3]/td/table/tr/td[2]/table/tr/td')
	cities_link_array.each do |link|
		links_all_cities_array<<link.css("a").map{ |linka| linka['href'] }
    	 end
  return links_all_cities_array
	
	#cities_link_array=page.xpath('//html/body/table/tr[3]/td/table/tr/td[2]/p[2]/object/table/tr[2]/td/table/tr/td[1]/p/a[1]')
	#puts page
	#puts cities_link_array

end

def get_list_of_links_cities_method_rest(url)
        links_all_cities_array=[]
        page = Nokogiri::HTML(RestClient.get(url))

	 cities_link_array=page.xpath('//html/body/table/tr[3]/td/table/tr/td[2]/table/tr/td')
        cities_link_array.each do |link|
                links_all_cities_array<<link.css("a").map{ |linka| linka['href'] }
         end
  return links_all_cities_array

end

  

def extract_emails(url)
        result=Hash.new
	get_list_of_links_cities_method_open(url).each do |html_link|
        	puts html_link
		page = Nokogiri::HTML(open(html_link))
		city_name =page.xpath('/html/body/div/main/section[2]/div/table/thead/tr/th[1]')
		email_mairie=page.xpath('//html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
	end
      result[city_name]=email_mairie
 
  return result
end

puts extract_emails("http://annuaire-des-mairies.com/val-d-oise.html")



