class Movie < ApplicationRecord
    #associate movies to a user
    belongs_to :user
    
    #Title: Must be present
    validates :title, presence: true
	
	#Hotness: Must be a number but presence is not mandatory
	validates :hotness, :numericality => {:allow_blank => true}
	
	#Image Url: Must be a url but presence is not mandatory
	#see 'validate_url' gem 
	validates :image_url, :url => {:allow_blank => true}
end
