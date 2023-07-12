class AddPositionToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :position, :integer
  end
end
