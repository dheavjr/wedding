class ChangeRsvpDefaultForGuest < ActiveRecord::Migration
  def change
  	remove_column :guests, :rsvp
  	add_column :guests, :rsvp, :boolean, :default => false
  end
end
