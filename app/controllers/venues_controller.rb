class VenuesController < ApplicationController
 
  def home
    @newvenue = Venue.new
    @searchvenue = Venue.new

  end

  def index
    @venues = Venue.all

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @venues }
    # end
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = @venue.bookings.new
    @booking.start_date_time = Time.now
    @booking.end_date_time = Time.now
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.json { render json: @venue }
    # end
  end


  def new
    @venue = Venue.new

    # respond_to do |format|
    #   format.html # new.html.erb
    #   format.json { render json: @venue }
    # end
  end

  def edit
    @venue = Venue.find(params[:id])
  end

  def create 
    @venue = Venue.new(params[:venue])
    if @venue.save
      redirect_to venues_path, notice: 'Venue was successfully created.'
    else
      render 'new', error: 'Oops, there was a problem creating the user.'
    end
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(params[:venue])
      redirect_to @venue, notice: 'Venue was successfully updated.'
    else
      render 'edit', error: 'Oops, there was a problem creating the user.'
    end

    # respond_to do |format|
    #   if @venue.update_attributes(params[:venue])
    #     format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
    #     format.json { head :ok }
    #   else
    #     format.html { render action: "edit", error: 'Oops, there was a problem creating the user.' }
    #     format.json { render json: @venue.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy

    # respond_to do |format|
    #   format.html { redirect_to venues_url }
    #   format.json { head :ok }
    # end
  end
end
