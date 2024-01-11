class HomeController < ApplicationController
  skip_before_action :authenticate_faculty!, only: %i[ index ]

  def index
    if faculty_signed_in? && current_faculty.admin?
      redirect_to books_path
    elsif faculty_signed_in? && current_faculty.staff?
      redirect_to members_path
    end
  end
end
