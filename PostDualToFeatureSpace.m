function [words weights] = PostDualToFeatureSpace(alpha, posts)

words = {};
weights = {};
n_posts = length(posts);
for i_post = 1:n_posts
  [words, weights] = PostFeatureSpace(...
      posts{i_post}, alpha(i_post), words, weights)
end
