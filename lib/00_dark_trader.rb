require 'pry'
require 'dotenv'# Appelle la gem Dotenv
require 'nokogiri'
require 'open-uri'

def get_html_from_url(url)
	
	return page = Nokogiri::HTML(open(url))

end

def extract_crypto_info(url)
	result=Hash.new
	
	
  all_crypto_info_array=get_html_from_url(url).xpath('//html/body/div[2]/div[2]/div/div/div[3]/div[2]/table/tbody/tr')


  all_crypto_info_array.each do |crypto_info|
    coin_name=crypto_info.css("td[class='no-wrap currency-name']").css("a[class='currency-name-container link-secondary']").text
    coin_price=crypto_info.css("td[class='no-wrap text-right']").css("a[class='price']").text
    result[coin_name]=coin_price
  end
  return result
end

extract_crypto_info("https://coinmarketcap.com/all/views/all/")
  #all_crypto_info_array=get_html_from_url(url).xpath('//*[@class="no-wrap currency-name"]')




