require 'rails_helper'

describe 'User visits the book show page' do
  scenario "I see the book title and a list of reviews for that book" do
    book = Book.create!(title: "Mody Dick")
    user = User.create!(name: 'Jimmy')
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 3, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content(book.title)
    expect(page).to have_content(review.content)
    expect(page).to have_content(review.rating)
  end

  scenario "I see the average rating for the book" do
    book = Book.create!(title: "Mody Dick")
    user = User.create!(name: 'Jimmy')
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 3, book_id: book.id)
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 4, book_id: book.id)
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 1, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content(book.average_rating)
  end

  scenario "I see the highest rating for the book" do
    book = Book.create!(title: "Mody Dick")
    user = User.create!(name: 'Jimmy')
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 3, book_id: book.id)
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 4, book_id: book.id)
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 1, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content(book.max_rating)
  end

  scenario "I see the lowest rating for the book" do
    book = Book.create!(title: "Mody Dick")
    user = User.create!(name: 'Jimmy')
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 3, book_id: book.id)
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 4, book_id: book.id)
    review = user.reviews.create!(content: "balaldkjasdfl;kajdsf", rating: 1, book_id: book.id)

    visit book_path(book)

    expect(page).to have_content(book.min_rating)
  end



end