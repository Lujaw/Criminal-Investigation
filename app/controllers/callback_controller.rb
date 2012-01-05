class CallbackController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :process_notification
  def process_notification
    begin
      params[:final_outputs].each do |output|
        @result=Result.new(:criminal_id => params[:meta_data],:name => output["name"] ,:age => output["age"] ,:gender => output["gender"] ,:race => output["race"] ,:eye_color => output["eye_color"] ,:hair_color => output["hair_color"] ,:additional_info => output["additional_info"])
        @result.photo = Criminal.find(params[:meta_data]).photo.to_s
        @result.save
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

