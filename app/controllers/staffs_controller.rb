class StaffsController < ApplicationController
  before_action :require_admin
  before_action :set_library

  def index
    @faculties = @library.faculties.all
    @q = @faculties.ransack(params[:q])
    @pagy, @faculties = pagy(@q.result(distinct: true), items: 12)
  end

  def new
    @staff = Faculty.new
  end

  def create
    @staff = @library.faculties.new(faculty_params)
    @staff.library_id = current_faculty.library_id
    @staff.password = '123456'

    respond_to do |format|
      if @staff.save
        FacultyMailer.welcome_email(@staff.email).deliver_later
        format.html { redirect_to staffs_path, notice: "faculty was successfully created." }
        format.json { render :index, status: :created, location: @staff }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @staff.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def faculty_params
    params.permit(:email, :user_type)
  end

  def set_library
    @library = Library.find(current_faculty.library_id)
  end
end
