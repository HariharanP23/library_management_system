class LibrariesController < ApplicationController
  before_action :require_admin, except: %i[ new create ]
  skip_before_action :authenticate_faculty!, only: %i[ new create ]
  before_action :set_library, only: %i[ show edit update destroy ]

  # GET /libraries/1 or /libraries/1.json
  def show
    if faculty_signed_in? && current_faculty.admin?
      redirect_to books_path
    elsif faculty_signed_in? && current_faculty.staff?
      redirect_to members_path
    end
  end

  # GET /libraries/new
  def new
    if faculty_signed_in? && current_faculty.admin?
      redirect_to books_path
    elsif faculty_signed_in? && current_faculty.staff?
      redirect_to members_path
    end
    @library = Library.new
  end

  # GET /libraries/1/edit
  def edit
  end

  # POST /libraries or /libraries.json
  def create
    @library = Library.new(library_params)

    respond_to do |format|
      if @library.save
        format.html { redirect_to library_url(@library), notice: "Library was successfully created." }
        format.json { render :show, status: :created, location: @library }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libraries/1 or /libraries/1.json
  def update
    respond_to do |format|
      if @library.update(library_params)
        format.html { redirect_to library_url(@library), notice: "Library was successfully updated." }
        format.json { render :show, status: :ok, location: @library }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libraries/1 or /libraries/1.json
  def destroy
    @library.destroy!

    respond_to do |format|
      format.html { redirect_to libraries_url, notice: "Library was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_library
      @library = Library.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def library_params
      params.require(:library).permit(:library_id, :name, :logo, :location, :established_date, :opening_hours_start, :opening_hours_end, :email)
    end
end
