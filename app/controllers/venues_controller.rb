class VenuesController < ApplicationController
 
  def home
    @newvenue = Venue.new

  end

  def index
    if params[:search]
      @venues = Venue.search(params[:search][:location], params[:search][:venue_category], params[:search][:venue_size])
    else
      @venues = Venue.all
    end
    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.json { render json: @venues }
    # end
  end

  def show
    @venue = Venue.find(params[:id])
    @booking = @venue.bookings.new(:confirmed => false, :start_date => Date.today, :start_time => Time.now, :end_date => Date.today, :end_time => Time.now)
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
      flash[:notice] = 'Venue was successfully created.'
      redirect_to venues_path
    else
      flash[:error] = 'Oops, there was a problem creating the user.'
      render 'new'
    end
  end

  def update
    @venue = Venue.find(params[:id])
    if @venue.update_attributes(params[:venue])
      flash[:notice] = 'Venue was successfully updated.'
      redirect_to venues_path
    else
      flash[:error] = 'Oops, there was a problem creating the user.'
      render 'edit'
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

  def destroy
    @venue = Venue.find(params[:id])
    @venue.destroy
    redirect_to venues_url 

    # respond_to do |format|
    #   format.html { redirect_to venues_url }
    #   format.json { head :ok }
    # end
  end
end
