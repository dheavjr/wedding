class AddRsvpToGuest < ActiveRecord::Migration
  def change
    add_column :guests, :rsvp, :boolean
  end
end
