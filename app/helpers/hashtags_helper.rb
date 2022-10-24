module HashtagsHelper
  def render_with_hashtags(hashtags)
    hashtags.map{|hashtag|(link_to "##{hashtag.name}", "#")}.join(' ').html_safe
  end
end
