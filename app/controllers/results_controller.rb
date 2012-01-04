class ResultsController < ApplicationController

  respond_to :html

  layout :false

  def index
    @criminals = Criminal.order("created_at desc")
  end

end