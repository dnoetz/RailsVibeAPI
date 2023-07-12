class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.string :category
      t.string :location
      t.string :image
      t.timestamps
    end
  end
end
