class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @reviews = @book.reviews
    @average_rating = @book.average_rating
    @max_rating = @book.max_rating
    @min_rating = @book.min_rating
  end
end