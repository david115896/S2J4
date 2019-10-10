require_relative '../lib/01_mairie_christmas' #fichier .rb

describe "get html and css from an url" do
  it "should return html" do
    expect(get_html_from_url("https://www.google.fr")).not_to be_nil
  end
end

describe "get coins info from no-wrap text-right " do
  it "shoul return a hash" do
    expect(get_list_of_links_cities_method_open("http://annuaire-des-mairies.com/val-d-oise.html")).to include("http://annuaire-des-mairies.com/95/ableiges.html")
  end
end

describe "get coins info from no-wrap text-right " do
  it "shoul return a hash" do
    expect(extract_emails("http://annuaire-des-mairies.com/val-d-oise.html")).to include("le-plessis-luzarches"=>"mairieplessisluzarches@orange.fr")
  end
end

