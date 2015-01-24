class SpecialQuestTime < ActiveRecord::Base
  serialize :time_table

  def self.create_now
    tweet = TweetSearcher.new.fetch
    extractor = TweetExtractor.new(tweet.text)
    time_table = extractor.extract.map do |row|
      {
        group: row[0],
        schedules: row[1].map do |row|
          {
            hour: row[0].to_i,
            special: row[1].present?,
          }
        end
      }
    end

    self.create(
      date: Time.zone.utc_to_local(tweet.created_at).strftime('%Y%m%d'),
      time_table: time_table,
      tweet_url: tweet.url.to_s,
    )
  end
end

