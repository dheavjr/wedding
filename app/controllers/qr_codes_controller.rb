class QrCodesController < ApplicationController
require 'rqrcode_png'
  def create
  	@guestID = qr_code_params
  	@guest = Guest.find(@guestID)
  	@qr = RQRCode::QRCode.new("localhost/"+@guest.name, :size => 5, :level => :h)
  	png = @qr.to_img
  	png.resize(200, 200).save("app/assets/images/"+@guest.name+".png")
  	
  	@guest.update_attribute :qr_code, png.to_string
  	
		@guest.qr_code = png
  	if @guest.save
  		redirect_to guests_path
  		flash[:success] = "QR code saved"
  	end
  end
  
  private
  	def qr_code_params
  		params[:id]
  	end
  end
