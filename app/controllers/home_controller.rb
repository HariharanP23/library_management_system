# frozen_string_literal: true

# HomeController
class HomeController < ApplicationController
  skip_before_action :authenticate_faculty!, only: %i[index]

  def index
    if faculty_signed_in? && current_faculty.admin?
      redirect_to books_path
    elsif faculty_signed_in? && current_faculty.staff?
      redirect_to users_path
    elsif member_signed_in?
      redirect_to login_members_books_path
    end
  end
end
