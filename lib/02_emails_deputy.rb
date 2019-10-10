require 'pry'
require 'dotenv'# Appelle la gem Dotenv
require 'nokogiri'
require 'open-uri'
#require 'restclient'


def get_link(url)
	return	page = Nokogiri::HTML(open(url))

end

def get_first_page_emails()

 first_email=Array.new
 deputy_list=Hash.new
 url="https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&lang=fr#pagination_deputes"
 first_email=get_link(url).css('ul[class="no_puce list_ann"]')
 first_email.map do |deputy|
   deputy_email=[]
   deputy_name=deputy.css("h2[class='titre_normal']").text
   deputy.css("a[class='ann_mail']").map{|email| if email['href'].to_s.include? "@" then deputy_email<<email['href'] end }
	#puts deputy_name,deputy_email
   deputy_list[deputy_name]=deputy_email
  end
  return  deputy_list	

end

def get_full_list()
  i=10
  full_list_emails=Hash.new
  full_list_emails=get_first_page_emails
  57.times do |x|
    url="https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&debut_deputes=#{i}#pagination_deputes"
    full_emails=get_link(url).css('ul[class="no_puce list_ann"]')
    full_emails.each do |deputy|
      deputy_email=[]
      deputy_name=deputy.css("h2[class='titre_normal']").text
      deputy.css("a[class='ann_mail']").map{|email| if email['href'].to_s.include? "@" then deputy_email<<email['href'] end }
      full_list_emails[deputy_name]=deputy_email

     end		
     i+=10
   end
return full_list_emails
end

puts get_full_list
