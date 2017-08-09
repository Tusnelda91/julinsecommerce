class Product < ApplicationRecord
	
  def self.search(search_term)
    like_operator = Rails.env.production? ? 'ilike' : 'like'
    Product.where("name #{like_operator} ?", "%#{search_term}%")
  end
	#def self.search(search_term)
     #   Product.where("name LIKE ?", "%#{search_term}%")
    #end

  def average_rating
    comments.average(:rating).to_f
  end
  
end
