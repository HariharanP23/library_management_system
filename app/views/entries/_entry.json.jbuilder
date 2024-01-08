json.extract! entry, :id, :book_id, :acquisition_date, :due_date, :return_date, :fine_amount, :member_id, :library_id, :created_at, :updated_at
json.url entry_url(entry, format: :json)
