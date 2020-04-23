# encoding: utf-8

class Match
  def self.hashtag_matcher(input)
    hashtag_regexp = /#[[:word:]-]+/
    input.scan(hashtag_regexp).join(', ')
  end
end

