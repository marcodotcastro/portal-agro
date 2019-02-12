class Video < ApplicationRecord
  belongs_to :produtor, optional: true
  belongs_to :produto, optional: true
end
