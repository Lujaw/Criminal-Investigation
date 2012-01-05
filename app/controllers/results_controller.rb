class ResultsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!
  helper_method :sort_column , :sort_direction
  def index
    @results = Result.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end
  def show
    @result = Result.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end
  private
  def sort_column
    Result.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

