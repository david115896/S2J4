require_relative '../lib/02_emails_deputy' #fichier .rb

describe "get html and css from an url" do
  it "should return html" do
    expect(get_html_from_url("https://www.google.fr")).not_to be_nil
  end
end

describe "get coins info from no-wrap text-right " do
  it "shoul return a hash" do
    expect(get_first_page_emails).to include(:first_name=>"Caroline", :last_name=>"Abadie", :emails=>["mailto:caroline.abadie@assemblee-nationale.fr"])
  end
end

describe "get coins info from no-wrap text-right " do
  it "shoul return a hash" do
    expect(get_full_list).to include(:first_name=>"Hélène", :last_name=>"Zannier", :emails=>["mailto:helene.zannier@assemblee-nationale.fr"])
  end
end

