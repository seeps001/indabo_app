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
    if @booking.save
      ### To be changed ###
      BookingMails.booking_request_mail(@booking.venue.name, @booking.start_date, @booking.start_time, booking_url(@booking)).deliver
      ###
      flash[:success] = 'The venue owner has been informed of your booking request.'
      redirect_to bookings_path
    else
      flash[:error] = 'Oops, there was a problem creating the booking.'
      render 'new'
    end
  end


  def update
    @booking = Booking.find(params[:id])
    if @booking.update_attributes(params[:booking])
      flash[:notice] = 'Booking was successfully updated.'
      redirect_to bookings_path
    else
      flash[:error] = 'Oops, there was a problem updating the booking.'
      render 'edit'
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
