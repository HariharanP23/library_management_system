# frozen_string_literal: true

# UsersController
class UsersController < ApplicationController
  before_action :require_staff
  before_action :set_library
  before_action :set_member, only: %i[show edit update]

  # GET /members or /members.json
  def index
    @members = @library.members.all
    @q = @members.ransack(params[:q])
    @pagy, @members = pagy(@q.result(distinct: true), items: 12)
  end

  # GET /members/1 or /members/1.json
  def show
    @entries = @member.entries.all
    @q = @entries.ransack(params[:q])
    @pagy, @entries = pagy(@q.result(distinct: true), items: 12)
    @entry = Entry.new
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit; end

  # POST /members or /members.json
  def create
    @member = Member.new(member_params)
    @member.library_id = current_faculty.library_id
    @member.password = '123456'
    respond_to do |format|
      if @member.save
        format.html { redirect_to user_url(@member), notice: 'Member was successfully created.' }
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
        format.html { redirect_to user_url(@member), notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1 or /members/1.json
  # def destroy
  #   @member.destroy!
  #
  #   respond_to do |format|
  #     format.html { redirect_to members_url, notice: "Member was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  def library_entry
    @entries = @library.entries.all
    @q = @entries.ransack(params[:q])
    @pagy, @entries = pagy(@q.result(distinct: true), items: 12)
  end

  def library_issues
    @issues = @library.issues.all
    @q = @issues.ransack(params[:q])
    @pagy, @issues = pagy(@q.result(distinct: true), items: 12)
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
    params.require(:member).permit(:first_name, :last_name, :code, :email, :dob, :phone_no, :expired_at, :amount,
                                   :library_id)
  end
end
