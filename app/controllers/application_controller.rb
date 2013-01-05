class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from NoMethodError do
    render_404
  end

  def render_404
    render :layout => false
    respond_to do |type|
      type.html { render :template => "task/error_404", :layout => "application", :status => "404 Not Found" }
      type.all { render :nothing => true, :status => "404 Not Found" }
    end
  end
end
