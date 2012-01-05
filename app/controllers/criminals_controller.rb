class CriminalsController < ApplicationController
  # GET /criminals
  # GET /criminals.json
  helper_method :sort_column , :sort_direction
  def index
    @criminals = Criminal.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @criminals }
    end
  end
  # GET /criminals/1
  # GET /criminals/1.json
  def show
    @criminal = Criminal.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @criminal }
    end
  end
  # GET /criminals/new
  # GET /criminals/new.json
  def new
    @criminal = Criminal.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @criminal }
    end
  end
  # GET /criminals/1/edit
  def edit
    @criminal = Criminal.find(params[:id])
  end
  # POST /criminals
  # POST /criminals.json
  def create
    @criminal = Criminal.new(params[:criminal])
    respond_to do |format|
      if @criminal.save
        @criminal.send_to_cf
        format.html { redirect_to @criminal, notice: 'Photo has been successfully uploaded.'}
        format.json { render json: @criminal, status: :created, location: @criminal }
      else
        format.html { render action: "new" }
        format.json { render json: @criminal.errors, status: :unprocessable_entity }
      end
    end
  end
  # PUT /criminals/1
  # PUT /criminals/1.json
  def update
    @criminal = Criminal.find(params[:id])
    respond_to do |format|
      if @criminal.update_attributes(params[:criminal])
        format.html { redirect_to @criminal, notice: 'Criminal was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @criminal.errors, status: :unprocessable_entity }
      end
    end
  end
  # DELETE /criminals/1
  # DELETE /criminals/1.json
  def destroy
    @criminal = Criminal.find(params[:id])
    @criminal.destroy

    respond_to do |format|
      format.html {}
      format.json { head :ok }
    end
  end
  private
  def sort_column
    Criminal.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
