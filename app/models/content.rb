class Content < ApplicationRecord
  extend Enumerize
  enumerize :kind, in: [:youtube, :instagram]

end
