class City < ApplicationRecord
  belongs_to :state
  
  def name_with_state
    "#{name} - #{state&.acronym}"
  end
end
