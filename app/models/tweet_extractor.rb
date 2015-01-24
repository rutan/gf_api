class TweetExtractor
  def initialize(text)
    @text = text
  end

  def extract
    CGI.unescape_html(@text).
      split("\n\n").
      map { |n| n.split('グループ').last }.
      select { |n| n[0] =~ /[A-H]/ }.
      map { |n| n.split("\n") }.
      map { |n|
        n.shift.split('&').map { |c|
          [
            c,
            n.map { |n| n.split('時') }
          ]
        }
      }.
      flatten(1).
      sort
  end
end

