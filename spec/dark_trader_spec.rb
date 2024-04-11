describe "scrape_crypto" do 
    it "should display currencies and their prices" do
        expect(scrape_crypto()).to be_a(Hash)
        expect(scrape_crypto()).not_to be(nil)
    end
end