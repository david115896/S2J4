require 'nokogiri'
require 'open-uri'

def mairie_Avernes()
    
   page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))
    
    mairie_avernes = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    
    mairie = []
    mairie_avernes.each do |mairie_avernes|
    #puts mairie_avernes
    
	    mairie << mairie_avernes.text
    end
    print mairie
    end    
#mairie_Avernes
    



    
def mairies()
    
    page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))

mairie_val_oise = page.xpath('//html/body/table/tr[3]/td/table/tr/td[2]/table/tr/td')


    
  

        city_hall = []
	mairie_val_oise.css('a').each do |mairie_val_oise_link|
		puts mairie_val_oise_link['href']
	end

            
            

       
    
end

mairies
