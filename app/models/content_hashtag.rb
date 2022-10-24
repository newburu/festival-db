class ContentHashtag < ApplicationRecord
  belongs_to :content
  belongs_to :hashtag

  with_options presence: true do
    validates :content_id
    validates :hashtag_id
  end
end
