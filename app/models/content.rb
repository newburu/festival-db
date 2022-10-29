class Content < ApplicationRecord
  extend Enumerize
  enumerize :kind, in: [:youtube, :instagram]

  has_many :content_hashtags, dependent: :destroy
  has_many :hashtags, through: :content_hashtags

  has_many :content_festivals, dependent: :destroy
  has_many :festivals, through: :content_festivals

  has_many :content_areas, dependent: :destroy
  has_many :areas, through: :content_areas


  after_create :make_references
  before_update :make_references

  def make_references
    content = Content.find_by(id: self.id)
    make_hashtags(content)
    make_festivals(content)
    make_areas(content)
  end

  def make_hashtags(content)
    hashtags  = self.detail.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    content.hashtags.clear
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
      content.hashtags << tag
    end
  end

  def make_festivals(content)
    content.festivals.clear
    content.hashtags.each do |hashtag|
      Festival.all.each do |festival|
        content.festivals << festival if festival.name== hashtag.name
      end
    end
  end

  def make_areas(content)
    content.areas.clear
    content.hashtags.each do |hashtag|
      Area.all.each do |area|
        content.areas << area if area.name == hashtag.name
      end
    end
  end

end
