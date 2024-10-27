# frozen_string_literal: true

class Category < ApplicationRecord
  belongs_to :library
  has_many :books

  # validation
  validates :name, uniqueness: true

  def self.ransackable_associations(_auth_object = nil)
    %w[books library]
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[created_at description id id_value library_id name updated_at]
  end
end
