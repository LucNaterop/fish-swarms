function e = expanse(pos)
n = length(pos);
mean = sum(pos)/n;
e = sum(sqrt( (pos(:,1)-mean(1)).^2 + (pos(:,2)-mean(2)).^2))/n;
end