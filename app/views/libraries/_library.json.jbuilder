# frozen_string_literal: true

json.extract! library, :id, :library_id, :name, :location, :established_date, :opening_hours_start, :opening_hours_end,
              :email, :created_at, :updated_at
json.url library_url(library, format: :json)
