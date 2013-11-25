class ApplicationController < ActionController::Base
  protect_from_forgery
  # skip_before_filter :verify_authenticity_token, :if =>lambda{ params[:authenticity_token].present? && params[:authenticity_token] == 'YOUR_SECRET_TOKEN' }
  skip_before_filter :verify_authenticity_token
  include SessionsHelper
end
