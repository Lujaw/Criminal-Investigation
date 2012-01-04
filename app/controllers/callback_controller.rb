class CallbackController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => :process_notification

  def process_notification
    begin
    params[:final_outputs].each do |output|
      Result.create(:criminal_id => params[:meta_data], :output => output)
    end
    render :nothing => true, :status => :ok
    rescue Exception => e
      log = "Error msg => " + e.message + "\n" + "Received Data => #{params.inspect}\n" + "Received on => #{Time.now}\n"
      ActiveRecord::Base.logger.info(log)
      ActiveRecord::Base.logger.flush
      render :text => log, :status => 500
    end
  end
end