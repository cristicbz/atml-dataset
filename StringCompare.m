function r = StringCompare(s1, s2)
% STRINGCOMPARE Compare two strings lexicographically. Because Matlab.

minl = min(length(s1), length(s2));
i = find(s1(1:minl) ~= s2(1:minl), 1);

if isempty(i)
  r = length(s1) - length(s2);
else
  r = s1(i) - s2(i);
end

