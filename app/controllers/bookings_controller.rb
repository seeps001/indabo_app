class BookingsController < ApplicationController


  def index
    @bookings = Booking.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end


  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

  def new
    @booking = Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booking }
    end
  end


  def edit
    @booking = Booking.find(params[:id])
  end


  def create
    @booking = Booking.new(params[:booking])

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, error: 'Oops, there was a problem creating the user.' }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit", error: 'Oops, there was a problem creating the user.' }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
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
