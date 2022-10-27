namespace :regist_contents do
  require 'google/apis/youtube_v3'
  require 'active_support/all'
  
  desc "YouTubeからコンテンツを登録する"
  task for_youtube: :environment do
    results = find_videos('播州秋祭')
    results.items.each do |item|
      id = item.id
      snippet = item.snippet
      url = "https://www.youtube.com/watch?v=#{id.video_id}"
      content = Content.find_or_initialize_by(url: url)
      content.kind = :youtube
      content.name = snippet.title
      content.detail = "#{snippet.title} by #{snippet.channel_title} (id: #{id.video_id}) (#{snippet.published_at})"
      p content
      content.save!
    end
  end

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ENV['GOOGLE_API_KEY']
    next_page_token = nil
    opt = {
      q: keyword,
      type: :video,
      order: :date,
      max_results: 50,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601,
      region_code: :JP
    }
    results = service.list_searches(:snippet, **opt)
  end

end
