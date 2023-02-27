class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :yoga_studio, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :checkin_date
      t.datetime :checkout_date
      t.string :booking_status

      t.timestamps
    end
  end
end
