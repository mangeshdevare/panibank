class DashboardController < ApplicationController
  layout 'user'
  before_filter :authenticate_user!
  
  def dashboard
  end
end
