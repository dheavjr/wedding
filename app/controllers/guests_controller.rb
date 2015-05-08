class GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]
	require 'rqrcode_png'
  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
  end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit
  end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)

    #respond_to do |format|
      if @guest.save
      	flash[:success] = 'Guest was successfully created.'
        redirect_to @guest
        #format.json { render :show, status: :created, location: @guest }
      else
      	render :new
        #format.html { render :new }
        #format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    #respond_to do |format|
      if @guest.update(guest_params)
      	flash[:success] = 'Guest was successfully updated.'
      	redirect_to @guest
       # format.html { redirect_to @guest, notice: 'Guest was successfully updated.' }
        #format.json { render :show, status: :ok, location: @guest }
      else
      	render :edit
        #format.html { render :edit }
        #format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    flash[:success] = 'Guest was successfully destroyed.'
    redirect_to guests_url
    #respond_to do |format|
      #format.html { redirect_to guests_url, notice: 'Guest was successfully destroyed.' }
      #format.json { head :no_content }
    #end
  end

	def show_image
		@guest = Guest.find(params[:id])
		send_data @guest.qr_code, :type => 'image/png', :disposition => 'inline'
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:name, :street1, :street2, :city, :state, :zip)
    end
  
end
