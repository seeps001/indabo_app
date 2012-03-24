class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :location
      t.string :description
      t.string :venue_size
      t.string :venue_category
      t.string :contact_no

      t.timestamps
    end
  end
end
