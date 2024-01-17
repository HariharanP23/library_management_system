class IssuesController < ApplicationController
  before_action :require_staff
  before_action :set_library
  before_action :set_user
  before_action :set_issue, only: %i[ destroy ]

  # GET /issues or /issues.json
  def index
    @issues = Issue.all
    @q = @issues.ransack(params[:q])
    @pagy, @issues = pagy(@q.result(distinct: true), items: 12)
    @issue = Issue.new
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # POST /issues or /issues.json
  def create
    @issue = Issue.new(issue_params)
    @issue.book_id = BookCopy.find(@issue.book_copy_id).book.id
    @issue.member_id = @member.id
    @issue.library_id = current_faculty.library_id

    respond_to do |format|
      if @issue.save
        format.html { redirect_to user_issues_path(@member.id), notice: "Issue was successfully created." }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1 or /issues/1.json
  def destroy
    @issue.destroy!

    respond_to do |format|
      format.html { redirect_to user_issues_url(@member.id), notice: "Issue was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

  def set_library
    @library = Library.find(current_faculty.library_id)
  end

  def set_user
    @member = @library.members.find(params[:user_id])
  end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:book_copy_id, :member_id, :library_id, :fine, :description, :book_id)
    end
end
