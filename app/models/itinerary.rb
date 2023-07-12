class Itinerary < ApplicationRecord
    acts_as_list
    belongs_to :user
    has_many :activities
end
