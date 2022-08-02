class HomeController < ApplicationController
  def index
    @user = Candidate.all
    
  end

  def signup
    @user = Candidate.new
  end

  def create
    @user = Candidate.new(candidate_params)
    if @user.save 
      flash[:notice]="Sign up successfully"
      redirect_to root_path
    else 
      render :create_path
    end
  end

  def log

  end

  def login 
    @user = Candidate.find_by(email: params[:email], password: params[:password])
    #flash[:notice]="log in successfully"
    
    if @user
      if @user.user_type.upcase=="CANDIDATE"
        session[:candidate_id]=@user.id
        redirect_to show_path
      elsif
        @user.user_type.upcase=="ADMIN"
        session[:user_id]=@user.id
        redirect_to userdetail_path
      else
        flash[:notice]="unsuccessfully"
        redirect_to root_path
      end
    else
      render "index"
    end
  end

  def userdetail 
    @user = Candidate.all
  end

  def detail 
    @user = Candidate.where(date: params[:date])
  end

  def delete
    session.delete(:user_id)
    session.delete(:candidate_id)
    redirect_to root_path
  end

  def candetail 
    @new = Candidate.find(params[:id])
  end

  def drivedata
    @drive = Candidate.find_by(name: params[:name], email: params[:email], password: params[:params], date: params[:date])
    if @drive.save
      redirect_to candetail_path
    else
      redirect_to drivedata_path
    end
  end

  def show 
    @user = Candidate.find(session[:candidate_id])
    
  end

  def applydrive
    
  end

  def fillform
    # if params[:name].blank?
    @drive = Candidate.find_by(name: params[:name], email: params[:email], password: params[:password])
    
    if @drive.update(date: params[:date])

      redirect_to show_path
    else
      redirect_to applydrive_path
    end
    #   redirect_to applydrive_path
    # end
  end



  private
  def candidate_params
    params.require(:candidate).permit(:name,:email,:password)
  end

end