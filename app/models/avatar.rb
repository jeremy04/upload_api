class Avatar < ApplicationRecord
  include ImageUploader[:photo]
end
