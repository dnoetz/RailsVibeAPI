class AddArchivedflagToItinerary < ActiveRecord::Migration[7.0]
  def change
    add_column :itineraries, :archived, :boolean
  end
end
