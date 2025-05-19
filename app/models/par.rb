class Par < ApplicationRecord
    geocoded_by :name  # or use an address column if available
    after_validation :geocode, if: :will_save_change_to_name?
end
