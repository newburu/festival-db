class Content < ApplicationRecord
  extend Enumerize
  enumerize :kind, in: [:youtube, :instagram]

  has_many :content_hashtags, dependent: :destroy
  has_many :hashtags, through: :content_hashtags

  has_many :content_shrines, dependent: :destroy
  has_many :shrines, through: :content_shrines

  has_many :content_festivals, dependent: :destroy
  has_many :festivals, through: :content_festivals

  has_many :content_areas, dependent: :destroy
  has_many :areas, through: :content_areas

  before_save :make_key
  def make_key
    if self.kind == "youtube"
      self.key = self.path[32..42]
    end
  end

  after_create :make_references
  before_update :make_references

  def make_references
    content = Content.find_by(id: self.id)
    change_detail_to_hashtags(content, Shrine.all.pluck(:name))
    change_detail_to_hashtags(content, Festival.all.pluck(:name))
    change_detail_to_hashtags(content, Area.all.pluck(:name))
    make_hashtags(content)
    make_shrines(content)
    make_festivals(content)
    make_areas(content)
  end

  # 詳細からハッシュタグ抽出する
  def change_detail_to_hashtags(content, keywords)
    keywords.each do |keyword|
      idx = self.detail.index(keyword)
      next if idx.nil?
      next if idx != 0 && ['#', '＃'].include?(self.detail[idx-1])

      self.detail.insert((idx + keyword.length), ' ')
      self.detail.insert(idx, ' #')
    end
  end

  # ハッシュタグデータを生成する
  def make_hashtags(content)
    hashtags = self.detail.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    content.hashtags.clear
    hashtags.uniq.map do |hashtag|
      #ハッシュタグは先頭の'#'を外した上で保存
      tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
      content.hashtags << tag
    end
  end

  # ハッシュタグからShrineとのリレーションを生成する
  def make_shrines(content)
    content.shrines.clear
    content.hashtags.each do |hashtag|
      Shrine.all.each do |shrine|
        content.shrines << shrine if shrine.name== hashtag.name
      end
    end
  end

  # ハッシュタグからFestivalとのリレーションを生成する
  def make_festivals(content)
    content.festivals.clear
    content.hashtags.each do |hashtag|
      Festival.all.each do |festival|
        content.festivals << festival if festival.name== hashtag.name
      end
    end
  end

  # ハッシュタグからAreaとのリレーションを生成する
  def make_areas(content)
    content.areas.clear
    content.hashtags.each do |hashtag|
      Area.all.each do |area|
        content.areas << area if area.name == hashtag.name
      end
    end
  end

end
