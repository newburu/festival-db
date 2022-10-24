class Hashtag < ApplicationRecord
  validates :name, presence: true, length: { maximum:99}
  has_many :festival_hashtags
  has_many :festivals, through: :festival_hashtags
end
