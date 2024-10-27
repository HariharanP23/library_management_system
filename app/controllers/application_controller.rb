# frozen_string_literal: true

# ApplicationController
class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :authenticate_faculty!

  def require_admin
    return if current_faculty&.admin?

    if request.xhr?
      head :unauthorized
    else
      flash[:error] = "You don't have permission to visit this page."
      redirect_to root_url
    end
  end

  def require_staff
    return if current_faculty&.staff?

    if request.xhr?
      head :unauthorized
    else
      flash[:error] = "You don't have permission to visit this page."
      redirect_to root_url
    end
  end
end
