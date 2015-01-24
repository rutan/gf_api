class TweetSearcher
  USER_ID = 1549889018 # @granbluefantasy

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
    end
  end
  attr_reader :client

  def fetch
    client.user_timeline(USER_ID.to_i).select { |twitter|
      twitter.text.include?('【時限クエ】')
    }.first
  end
end

