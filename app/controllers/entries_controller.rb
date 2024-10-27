# frozen_string_literal: true

# EntriesController
class EntriesController < ApplicationController
  before_action :require_staff
  before_action :set_library
  before_action :set_member
  before_action :set_entry, only: %i[edit update destroy update_return_date]

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  def update_return_date
    @entry.update!(return_date: Date.today, fine_amount: calculate(@entry))
    redirect_to user_url(@member.id)
  end

  # GET /entries/1/edit
  def edit; end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params)

    respond_to do |format|
      if @entry.save
        format.html { redirect_to user_path(@member.id), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to member_url(@member.id), notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy!

    respond_to do |format|
      format.html { redirect_to user_url(@member.id), notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_library
    @library = Library.find(current_faculty.library_id)
  end

  def set_member
    @member = Member.find(params[:user_id])
  end

  def set_entry
    @entry = @member.entries.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def entry_params
    params.require(:entry).permit(:book_id, :start_date, :due_date, :return_date, :fine_amount, :member_id,
                                  :library_id)
  end

  def calculate(entry)
    return unless entry.due_date.present?

    fine = 0
    date_difference = Date.today - entry.due_date
    fine_per_day = 10
    fine = date_difference * fine_per_day if date_difference.positive?
    fine
  end
end
