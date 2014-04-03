function gram = GramPost(posts)

n_posts = length(posts);
gram = zeros(n_posts);
for i_post = 1:n_posts
  i_post
  for j_post = i_post:n_posts
    gram(i_post, j_post) = PostKernel(posts{i_post}, posts{j_post});
  end
end

gram = (gram' + gram) - diag(diag(gram));

% This is an ugly hack: if the matrix is not positive definite, keep adding the
% minimal eigenvalue to the diagonal until it is. This amounts to a tiny
% total difference (on the order of 1e-16 generally.)
z = min(eig(gram));
while z < 0
  gram= gram - eye(n_posts) * z * 1.1;
  z = min(eig(gram));
end


