json.extract! book, :id, :title, :author, :isbn, :published_date, :copies_available, :total_copies, :price, :row, :description, :category_id, :library_id, :created_at, :updated_at
json.url book_url(book, format: :json)
