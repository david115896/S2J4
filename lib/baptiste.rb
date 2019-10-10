require 'open-uri'
require 'nokogiri'

def recup_symbols
    crypto_symbol_array = []                             #créé un tableau vierge
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    page.xpath('//td//span/a[@class ="link-secondary"]').each do |symbol|
    crypto_symbol_array << symbol.text                                                    #ajoute chaque symbol dans leur array
     end
     return crypto_symbol_array
end
def recup_values
    crypto_value_array = []
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    page.xpath('//td/a[@class ="price"]').each do |value|
    crypto_value_array << value.text.delete('$').to_f
     end
     return crypto_value_array
end 
def perform
	result=Hash.new
    array_final = []                                                                  #création de l'array final qui regroupe les deux
    crypto_symbol_array = recup_symbols                                               #appel des 2 méthodes
    crypto_value_array = recup_values                                                 #appel des 2 méthodes
    crypto_symbol_array.each_index do |x|
	result[crypto_symbol_array[x]]=crypto_value_array[x]
    end
    

    return result
end
puts perform
