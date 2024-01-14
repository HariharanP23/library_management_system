class LoginMembersController < ApplicationController
  skip_before_action :authenticate_faculty!
  before_action :authenticate_member!
  before_action :set_library

  def entries
    @entries = current_member.entries.all
    @q = @entries.ransack(params[:q])
    @pagy, @entries = pagy(@q.result(distinct: true), items: 12)
  end

  def books
    @books = @library.books.all
    @q = @books.ransack(params[:q])
    @pagy, @books = pagy(@q.result(distinct: true), items: 12)
  end

  private
  def set_library
    @library = Library.find(current_member.library_id)
  end
end