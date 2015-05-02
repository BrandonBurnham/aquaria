class InhabitantsController < ApplicationController

  def show
    @aquarium = Aquarium.find(params[:aquarium_id])
    @inhabitant = @aquarium.inhabitants.find(params[:id])
  end
  
  def new
    @aquarium = Aquarium.find(params[:aquarium_id])
    @inhabitant = @aquarium.inhabitants.new
  end
  
  def create
    @aquarium = Aquarium.find(params[:aquarium_id])
    @inhabitant = @aquarium.inhabitants.create(inhab_params)
    flash[:success] = "Inhabitant Added!"
    redirect_to aquarium_path(@aquarium)
  end
  
  def edit
    @aquarium = Aquarium.find(params[:aquarium_id])
    @inhabitant = @aquarium.inhabitants.find(params[:id])
  end
  
  def update
    @aquarium = Aquarium.find(params[:aquarium_id])
    @inhabitant = @aquarium.inhabitants.find(params[:id])
 
    if @inhabitant.update_attributes(inhab_params)
      flash[:success] = "Inhabitant Updated!"
      redirect_to aquarium_path(@aquarium)
    else
      render 'edit'
    end
  end
  
  def destroy
    @aquarium = Aquarium.find(params[:aquarium_id])
    @inhabitant = @aquarium.inhabitants.find(params[:id])
    
    @inhabitant.destroy
    flash[:success] = "Inhabitant Deleted!"
    redirect_to aquarium_path(@aquarium)
  end
  
  private
    def inhab_params
      params.require(:inhabitant).permit(:inhabitant_type, :name, :description, :quantity)
    end
end
