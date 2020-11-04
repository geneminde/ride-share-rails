class DriversController < ApplicationController
  def index
    @drivers = Driver.all.order(:id)
  end

  def show
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      head :not_found
      return
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)
    if @driver.save
      redirect_to driver_path(@driver.id)
      return
    else
      redirect_to new_driver_path
      return
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])

    if @driver.nil?
      redirect_to drivers_path
    end
  end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin, :available)
  end
end

