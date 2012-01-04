class CriminalsController < ApplicationController
  # GET /criminals
  # GET /criminals.json
  helper_method :sort_column , :sort_direction
  def index
   # @criminals = Criminal.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 5, :page => params[:page])
 @criminals = Criminal.search(params[:search]).paginate(:per_page => 5, :page => params[:page])
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
    # @input = Input.new(params[:input])
    #
    #      flash[:notice] = 'Input was successfully added.' if @input.save
    #
    #      # Checking whether the run with title `marriageability` exists under my account or as public
    #      run = CF::Run.find("marriageability")
    #
    #      # To save the above coudfactory external request call time, you can store it somewhere in initializer or config
    #      # And you can write the following code in such a way:
    #      # units = CF::Run.add_units({:run_title => "Marriageability", :units => [{"image_url" => @input.image_url, :meta_data => @input.id}]})
    #
    #
    #      if run['errors'].present?
    #        run = CF::Run.create("taken/marriageability", "Marriageability", [{"image_url" => @input.image_url, :meta_data => @input.id}])
    #      # To save the above coudfactory external request call time, you can store it somewhere in initializer or config
    #      # And you can write the following code in such a way:
    #      # units = CF::Run.add_units({:run_title => "Marriageability", :units => [{"image_url" => @input.image_url, :meta_data => @input.id}]})
    #      else
    #        units = CF::Run.add_units({:run_title => "Marriageability", :units => [{"image_url" => @input.image_url, :meta_data => @input.id}]})
    #      end
    #      respond_with(@input, :location => root_path)


    @criminal = Criminal.new(params[:criminal])
    respond_to do |format|
      if @criminal.save
        # run = CF::Run.find("presha-2012jan04-121635")
        #         units = CF::Run.add_units({:run_title => "presha-2012jan04-121635", :units => [{"image_url" => @criminal.photo, :meta_data => @criminal.id}]})
       run = CF::Run.create("lujaw/criminaldb-4", "test3", [{"image_url" => @criminal.photo, :meta_data => @criminal.id}])
    #    units = CF::Run.add_units({:run_title => "criminaldb", :units => [{"image_url" => @criminal.photo, :meta_data => @criminal.id}]})
            binding.pry
        format.html { redirect_to @criminal, notice: 'Photo has been successfully upploaded.'}
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
      format.html { redirect_to criminals_url }
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


    def results
      puts params
      binding.pry
      puts params
    end
end
