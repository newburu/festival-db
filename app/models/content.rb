class Content < ApplicationRecord
  extend Enumerize
  enumerize :kind, in: [:youtube, :instagram]

  has_many :content_hashtags, dependent: :destroy
  has_many :hashtags, through: :content_hashtags


  after_create :make_hashtags
  before_update :make_hashtags
  def make_hashtags
    content = Content.find_by(id: self.id)
    hashtags  = self.detail.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    content.hashtags.clear
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
      content.hashtags << tag
    end
  end

end
