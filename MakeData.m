function [posts sentiments] = MakeData(n_points)

positive = {'good', 'excellent', 'ludicrous', 'exceptional', 'exquisite', ...
            'improvement', 'terrific', 'delirious', 'divine', 'great', ...
            'brilliant', 'excellent', 'novel'};

negative = {'dismal', 'desolate', 'terrible', 'horrible', 'miserable', ...
            'bad', 'worst', 'stupid', 'dumb', 'ineffectual', 'ugly', ...
            'disappointing'};

neutral = {'the', 'a', 'did', 'had', 'ball', 'match', 'goal', 'crowd', ...
           'people', 'game', 'score', 'unbeliveable', 'doesnt', 'may', ...
           'might', 'not', 'possibly', 'quite', 'drive'};

sentiments = betarnd(0.8, 0.8, [n_points, 1]);
posts = {};
for i_point = 1:n_points
  sentiment = sentiments(i_point);
  n_neutral_words = geornd(0.2) + 6;
  n_sentiment_words = geornd(0.08) + 2;
  post = [];
  for i_word = 1:(n_sentiment_words + n_neutral_words)
    if n_sentiment_words == 0 || (n_neutral_words > 0 && rand() > 0.5)
      word_class = neutral;
      n_neutral_words = n_neutral_words - 1;
    else
      if rand() <= sentiment
        word_class = positive;
      else
        word_class = negative;
      end
      n_sentiment_words = n_sentiment_words - 1;
    end
    post{i_word} = word_class{ceil(rand() * length(word_class))};
  end
  posts{i_point} = post;
end

end
