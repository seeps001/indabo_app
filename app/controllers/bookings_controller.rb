class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit
    @booking = Booking.find(params[:id])
  end


  def create
    @booking = Booking.new(params[:booking])
    respond_to do |format|
      if @booking.save
        format.html { redirect_to bookings_path, notice: 'Booking was successfully updated.' }
      else
        format.html { render 'new', error: 'Oops, there was a problem creating the booking.' }
      end
    end
  end


  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to bookings_path, notice: 'Booking was successfully updated.' }
      else
        format.html { render action: "edit", error: 'Oops, there was a problem updating the booking.' }
      end
    end
  end


  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :ok }
    end
  end
end
