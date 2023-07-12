class AddItineraryIdToActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :activities, :itinerary, foreign_key: true
  end
end
