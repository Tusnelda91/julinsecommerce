class Product < ApplicationRecord

    validates :name, presence: true
    has_many :orders
    has_many :comments

	
  def self.search(search_term)
    like_operator = Rails.env.production? ? 'ilike' : 'like'
    Product.where("name #{like_operator} ?", "%#{search_term}%")
  end

	
  def highest_rating_comment
	comments.rating_desc.first
  end

  def lowest_rating_comment 
    comments.rating_asc.first
  end

	#def self.search(search_term)
     #   Product.where("name LIKE ?", "%#{search_term}%")
    #end


  def average_rating
    comments.average(:rating).to_f
  end


  def views
    $redis.get("product:#{id}")
  end

  def viewed!
    $redis.incr("product:#{id}")
  end



end
