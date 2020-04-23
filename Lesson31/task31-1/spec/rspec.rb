# encoding: utf-8

require_relative 'task'

describe Match do
  it "should do ok for 1 hashtag" do
    expect(Match.hashtag_matcher('один #hashtag')).to eq "#hashtag"
  end

  it "should do ok for multiple hashtags" do
    expect(Match.hashtag_matcher('один #hashtag, второй #2hashtag')).to eq "#hashtag, #2hashtag"
  end

  it "should do ok for hashtag on russian" do
    expect(Match.hashtag_matcher('один #хештег')).to eq "#хештег"
  end

  it "should do ok for hashtag with underscore" do
    expect(Match.hashtag_matcher('один #my_hashtag')).to eq "#my_hashtag"
  end

  it "should do ok for hashtag with dash" do
    expect(Match.hashtag_matcher('один #my-hashtag')).to eq "#my-hashtag"
  end

  it "should do ok for hashtag with exclamation mark" do
    expect(Match.hashtag_matcher('один #hashtag!')).to eq "#hashtag"
  end

  it "should do ok for hashtag with question mark" do
    expect(Match.hashtag_matcher('один #hashtag?')).to eq "#hashtag"
  end
end
