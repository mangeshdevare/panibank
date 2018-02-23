class UsersController < ApplicationController
  before_filter :authenticate_user!
  layout 'user'
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new()
  end
  
  def create_user
    puts "==================="
    @user = User.new(params[:user])
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    
  end
  
  def upload_csv
    async_job = current_user.async_jobs.create(:job_owner => User.name, :csv => params[:csv], :status => AsyncJob::Status::PROCESSING)
    async_job.execute
    flash[:notice] = "Processing"
    redirect_to users_path
  end

end
