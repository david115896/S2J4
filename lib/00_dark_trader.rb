require 'pry'
require 'dotenv'# Appelle la gem Dotenv
require 'nokogiri'
require 'open-uri'

def get_html_from_url(url)
	
	return page = Nokogiri::HTML(open(url))

end

def extract_crypto_info(url)
  result_array=Array.new
  all_crypto_info_array=get_html_from_url(url).xpath('//html/body/div[2]/div[2]/div/div/div[3]/div[2]/table/tbody/tr')
  all_crypto_info_array.each do |crypto_info|
    result_hash=Hash.new
    coin_name=crypto_info.css("td[class='text-left col-symbol']").text
    coin_price=crypto_info.css("td[class='no-wrap text-right']").css("a[class='price']").text.to_s.delete"$"
    result_hash[coin_name]=coin_price
    result_array<<result_hash
  end
  return result_array
end

puts extract_crypto_info("https://coinmarketcap.com/all/views/all/")

