class AddQrCodeToGuest < ActiveRecord::Migration
  def change
  	add_column :guests, :qr_code, :blob
  end
end
