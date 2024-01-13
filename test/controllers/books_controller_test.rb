require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { author: @book.author, category_id: @book.category_id, copies_available: @book.copies_available, description: @book.description, isbn: @book.isbn, library_id: @book.library_id, price: @book.price, published_date: @book.published_date, row: @book.row, title: @book.title, total_copies: @book.total_copies } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, category_id: @book.category_id, copies_available: @book.copies_available, description: @book.description, isbn: @book.isbn, library_id: @book.library_id, price: @book.price, published_date: @book.published_date, row: @book.row, title: @book.title, total_copies: @book.total_copies } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
