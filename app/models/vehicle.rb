class Vehicle < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: true
	validates :image_url, :url => {:allow_blank => true}
end
