class Admin::BaseController < ApplicationController
 
  def authenticate 
    authenticate_or_request_with_http_basic do |user, password| 
      password == ENV['PASSWORD'] && user == ENV['USERNAME'] 
    end 
  end

end
