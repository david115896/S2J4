require_relative '../lib/00_dark_trader' #fichier .rb

describe "get html and css from an url" do
  it "should return html" do
    expect(get_html_from_url("https://www.google.fr")).not_to be_nil
  end
end

describe "get coins info from no-wrap text-right " do
        it "shoul return a hash" do
        expect(extract_coins_info("https://coinmarketcap.com/all/views/all/")).to include("Bitcoin","Ethereum")
end

end
