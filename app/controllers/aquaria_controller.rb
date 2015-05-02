class AquariaController < ApplicationController
  before_action :signed_in_user

  def index
    @aquarium = Aquarium.all
  end

  def show
    @aquarium = Aquarium.find(params[:id])
  end

  def new
    @aquarium = Aquarium.new
  end

  def create
    @aquarium = Aquarium.new(aquarium_params)

    @aquarium.save
    flash[:success] = "Aquarium Added!"
    redirect_to @aquarium
  end
  
  def destroy
    @aquarium = Aquarium.find(params[:id])
    AquaMailer.delete_email(@aquarium).deliver
    @aquarium.destroy
    flash[:success] = "Aquarium Deleted!"
    redirect_to aquaria_path
  end
  
  def edit
    @aquarium = Aquarium.find(params[:id])
  end
  
  def update
    @aquarium = Aquarium.find(params[:id])
 
    if @aquarium.update_attributes(aquarium_params)
      flash[:success] = "Aquarium Updated!"
      redirect_to aquaria_path
    else
      render 'edit'
    end
  end

  private
    def aquarium_params
      params.require(:aquarium).permit(:name, :location, :gallons, :water_type, :status, :notes)
    end
    
    # Before filters

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
