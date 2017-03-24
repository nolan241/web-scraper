class Scrape
	attr_accessor :title, :price, :image_url, :miles, :overview, :failure

	def scrape_new_vehicle(url)
		begin
			doc = Nokogiri::HTML(open(url))
			doc.css('script').remove 
			self.title = doc.at("//h1[@itemprop = 'name']").text
			self.price = doc.at("//h4[@itemprop = 'priceCurrency']").text
			self.image_url = doc.at_css('#vdp.pag-vdp .swiper-slide a img')['src']
			self.miles = doc.at_css('//#vdp-vehicle-overview .table').text
			
    			o = doc.at('div#vehicle-overview-text').text
    			if ! o.valid_encoding?
    				o = o.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
    			end
			self.overview = o
	
			return true
		
		rescue Exception => e
			self.failure = "Something went wrong with the scrape"
		end
	end
	
end


#notes for scraping 
# Vehicle(id: integer, title: string, price: string, image_url: string, overview: text, miles: string, user_id: integer, created_at: datetime, updated_at: datetime) 

# doc = Nokogiri::HTML(open("http://nb.ebizautos.com/detail-2012-land_rover-range_rover-4wd_4dr_hse-used-10697046.html"))
# doc.css('script').remove
# Title
# 	doc.at("//h1[@itemprop = 'name']").text
# Price
# 	doc.at("//h4[@itemprop = 'priceCurrency']").text
# Image
# 	doc.at_css('#vdp.pag-vdp .swiper-slide a img')['src']
# Miles
# 	doc.at_css('//#vdp-vehicle-overview .table').text
# Overview
# 	doc.at('div#vehicle-overview-text').text	