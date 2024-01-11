class MembersController < ApplicationController
  before_action :set_library
  before_action :set_member, only: %i[ show edit update destroy ]

  # GET /members or /members.json
  def index
    @members = @library.members.all
  end

  # GET /members/1 or /members/1.json
  def show
    @entries = @member.entries.all
    @entry = Entry.new
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)
    @member.library_id = current_faculty.library_id

    respond_to do |format|
      if @member.save
        format.html { redirect_to member_url(@member), notice: "Member was successfully created." }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1 or /members/1.json
  def update
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to member_url(@member), notice: "Member was successfully updated." }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  def destroy
    @member.destroy!

    respond_to do |format|
      format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def library_entry
    @entries = @library.entries.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_library
    @library = Library.find(current_faculty.library_id)
  end

  def set_member
    @member = @library.members.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:name, :code, :email, :dob, :phone_no, :expired_at, :amount, :library_id)
    end
end
