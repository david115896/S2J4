require_relative '../lib/02_emails_deputy' #fichier .rb

describe "get html and css from an url" do
  it "should return html" do
    expect(get_html_from_url("https://www.google.fr")).not_to be_nil
  end
end

describe "get coins info from no-wrap text-right " do
  it "shoul return a hash" do
    expect(get_first_page_emails).to include("M Damien Abad"=>["mailto:contact@damien-abad.fr", "mailto:damien.abad@assemblee-nationale.fr"])
  end
end

describe "get coins info from no-wrap text-right " do
  it "shoul return a hash" do
    expect(get_full_list).to include("M Jean-Marc Zulesi"=>["mailto:jean-marc.zulesi@assemblee-nationale.fr"])
  end
end

