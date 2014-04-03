function k = PostKernel(a, b)

if length(a) > length(b)
  aux = a;
  a = b;
  b = aux;
end

minl = length(a);
k = 0;
for i_a = 1:minl
  k = k + sum(strcmp(a{i_a}, b));
end


%a = sort(a);
%b = sort(b);

%ai = 1;
%bi = 1;
%k = 0;

%while ai <= length(a) && bi <= length(b)
%  c = StringCompare(a{ai}, b{bi});
%  if c == 0
%    k = k + 1;
%    ai = ai + 1;
%    bi = bi + 1;
%  elseif c < 0
%    ai = ai + 1;
%  else
%    bi = bi + 1;
%  end
%end

