class PackagePhoto < ApplicationRecord
  belongs_to :subscription
  belongs_to :photo
end
