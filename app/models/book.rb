class Book < ApplicationRecord
  has_many :reviews

  def average_rating
    sum = 0
    reviews.each do |review|
      sum += review.rating
    end
    average = sum/(reviews.length)
    return average
  end

  def max_rating
    ratings = reviews.map do |review|
      review.rating
    end
    ratings.max
  end

  def min_rating
    ratings = reviews.map do |review|
      review.rating
    end
    ratings.min
  end
    
end
