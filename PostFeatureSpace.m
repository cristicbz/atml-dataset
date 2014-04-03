function [new_words new_counts] = PostFeatureSpace( ...
    post, post_multiplier, old_words, old_counts)

if nargin < 2; post_multiplier = 1; end
if nargin < 3; old_words = {}; old_counts = []; end

post = sort(post);
post_length = length(post);
old_length = length(old_words);

old_i = 1;
new_i = 0;
post_i = 1;

while post_i <= post_length || old_i <= old_length
  if old_i > old_length
    % Ran out of old words, add the remaining post words.
    new_word = post{post_i};
    new_count = post_multiplier;
    post_i = post_i + 1;
  elseif post_i > post_length
    % Ran out of post words, add the remaining old words and counts.
    new_word = old_words{old_i};
    new_count = old_counts(old_i);
    old_i = old_i + 1;
  else
    % Have both old and post words, perform linear merge.
    comparison = StringCompare(post{post_i}, old_words{old_i});
    if comparison == 0
      % Equal post and old word: add up counts and move up in both.
      new_word = post{post_i};
      new_count = post_multiplier + old_counts(old_i);
      post_i = post_i + 1;
      old_i = old_i + 1;
    elseif comparison < 0
      % Lower word in post, add it and move up.
      new_word = post{post_i};
      new_count = post_multiplier;
      post_i = post_i + 1;
    else
      % Lower word in old vector, add it and move up.
      new_word = old_words{old_i};
      new_count = old_counts(old_i);
      old_i = old_i + 1;
    end
  end

  if new_i > 0 && strcmp(new_word, new_words{new_i})
    new_counts(new_i) = new_counts(new_i) + new_count;
  else
    new_i = new_i + 1;
    new_words{new_i} = new_word;
    new_counts(new_i) = new_count;
  end
end
