class AddReferencesToUserActivities < ActiveRecord::Migration[7.0]
  def change
    add_reference :user_activities, :user, null: false, foreign_key: true
    add_reference :user_activities, :activity, null: false, foreign_key: true
  end
end
