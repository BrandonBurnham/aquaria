class ChemistriesController < ApplicationController

  def new
    @aquarium = Aquarium.find(params[:aquarium_id])
    @chemistry = @aquarium.chemistries.new
  end
  
  def create
    @aquarium = Aquarium.find(params[:aquarium_id])
    @chemistry = @aquarium.chemistries.create(chem_params)
    redirect_to aquarium_path(@aquarium)
  end
  
  def update
    @aquarium = Aquarium.find(params[:aquarium_id])
    @chemistry = @aquarium.chemistries.find(params[:id])
 
    if @chemistry.update_attributes(chem_params)
      flash[:success] = "Record Updated!"
      redirect_to aquarium_path(@aquarium)
    else
      render 'edit'
    end
  end
  
  def show
    @aquarium = Aquarium.find(params[:aquarium_id])
    @chemistry = @aquarium.chemistries.find(params[:id])
  end
  
  def edit
    @aquarium = Aquarium.find(params[:aquarium_id])
    @chemistry = @aquarium.chemistries.find(params[:id])
  end
  
  def destroy
    @aquarium = Aquarium.find(params[:aquarium_id])
    @chemistry = @aquarium.chemistries.find(params[:id])
    
    @chemistry.destroy
    flash[:success] = "Record Deleted!"
    redirect_to aquarium_path(@aquarium)
  end
    
  private
    def chem_params
      params.require(:chemistry).permit(:water_ph,:water_nh3, :water_no3, :water_no2, :water_temp, :test_date)
    end
end
