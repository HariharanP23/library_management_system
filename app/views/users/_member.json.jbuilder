# frozen_string_literal: true

json.extract! member, :id, :name, :code, :email, :dob, :phone_no, :expired_at, :amount, :library_id, :created_at,
              :updated_at
json.url member_url(member, format: :json)
