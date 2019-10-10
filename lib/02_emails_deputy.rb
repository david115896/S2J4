require 'pry'
require 'dotenv'# Appelle la gem Dotenv
require 'nokogiri'
require 'open-uri'
#require 'restclient'


def get_html_from_url(url)
	return	page = Nokogiri::HTML(open(url))

end

def get_first_page_emails()
  #first_email_array=Array.new
  deputy_emails_array=Array.new
  full_list_emails_array=Array.new

  url="https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&lang=fr#pagination_deputes"
  first_email=get_html_from_url(url).css('ul[class="no_puce list_ann"]')
  first_email.map do |deputy|
    full_list_emails_hash=Hash.new
    deputy_emails_array=[]
    deputy_last_name=deputy.css("h2[class='titre_normal']").text.split[2]
    deputy_first_name=deputy.css("h2[class='titre_normal']").text.split[1]
    deputy.css("a[class='ann_mail']").map{|email| if email['href'].to_s.include? "@" then deputy_emails_array<<email['href'] end }
    full_list_emails_hash[:first_name]=deputy_first_name
    full_list_emails_hash[:last_name]=deputy_last_name
    full_list_emails_hash[:emails]=deputy_emails_array
    full_list_emails_array<<full_list_emails_hash
    
  end
  return  full_list_emails_array	

end

def get_full_list()
  i=10
  deputy_emails_array=Array.new
  full_list_emails_array=Array.new
  full_list_emails_array=get_first_page_emails
  57.times do |x|
    url="https://www.voxpublic.org/spip.php?page=annuaire&cat=deputes&debut_deputes=#{i}#pagination_deputes"
    full_emails=get_html_from_url(url).css('ul[class="no_puce list_ann"]')
    full_emails.each do |deputy|
      full_list_emails_hash=Hash.new  
      deputy_emails_array=[]
      deputy_last_name=deputy.css("h2[class='titre_normal']").text.split[2]
      deputy_first_name=deputy.css("h2[class='titre_normal']").text.split[1]
      deputy.css("a[class='ann_mail']").map{|email| if email['href'].to_s.include? "@" then deputy_emails_array<<email['href'] end }
      full_list_emails_hash[:first_name]=deputy_first_name
      full_list_emails_hash[:last_name]=deputy_last_name
      full_list_emails_hash[:emails]=deputy_emails_array
      full_list_emails_array<<full_list_emails_hash
    end		
  i+=10 
  end
  return full_list_emails_array
  puts full_list_emails_array.size
end

puts get_full_list
