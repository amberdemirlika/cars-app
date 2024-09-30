class CarsController < ApplicationController
  skip_forgery_protection


  def index
    @cars = Car.all
    render :index
  end
  

  def show
    @car = Car.find_by(id: params[:id])
    render :show
  end
  

  def create
    @car = Car.new(
      make: params[:make],
      model: params[:model],
      year: params[:year],
      price: params[:price]
      )

    if @car.save!
      render :show
    else
      #error handling
      render json: { errors: @car.errors.full_messages}, 
      status: :unprocessable_entity
    end

  end


  def update
      
    @car = Car.find_by(id: params[:id])

    @car.update(
      make: params[:make] || @car.make,
      model: params[:model] || @car.model,
      year: params[:year] || @car.year,
      price: params[:price] || @car.price,
    )
    @car.save

    render :show
  end


  def destroy
    @car = Car.find_by(id: params[:id])
    @car.destroy
    render json: { message: "product has been removed" }
  end






end
