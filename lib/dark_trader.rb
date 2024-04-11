require 'nokogiri'
require 'open-uri'

def scrape_crypto()
  doc = Nokogiri::HTML5(URI.open("https://coinmarketcap.com/all/views/all/"))

  crypto_page = doc.xpath('//tr[contains(@class, "cmc-table-row")]')

  hash = {}

  crypto_page.each do |row|
    name = row.xpath('.//td[3]').text
    price = row.xpath('.//td[5]').text
    hash[name] = price
  end

  hash
end

hash = scrape_crypto()

scrape_crypto.each do |name, price|
  puts "#{name} => #{price}"
end