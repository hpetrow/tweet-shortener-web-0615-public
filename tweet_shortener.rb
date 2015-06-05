# Write your code here.

def word_substituter(tweet)
  substitutes = {
    :hello => "hi",
    :to => "2", :two => "2", :too => "2",
    :for => "4", :four => "4",
    :be => "b",
    :you => "u",
    :at => "@",
    :and => "&"
  }

  words = tweet.split(" ")
  sub_words = words.collect { |word|
    word = substitutes.has_key?(word.downcase.to_sym) ?
      substitutes[word.downcase.to_sym] : word
  }
  sub_words.join(" ")
end

def bulk_tweet_shortener(tweet_list)
  new_tweet_list = tweet_list.collect { |tweet|
    tweet = word_substituter(tweet)
    puts tweet
  }
  new_tweet_list
end

def selective_tweet_shortener(tweet)
  tweet.length > 140 ? word_substituter(tweet) : tweet
end

def shortened_tweet_truncator(tweet)
  shortened_tweet = selective_tweet_shortener(tweet)
  shortened_tweet.length > 140 ?
    shortened_tweet.slice(0, 137) << "..." : shortened_tweet
end
