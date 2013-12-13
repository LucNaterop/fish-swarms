function r = rank123(pos,vel)
 
n = length(pos);
projection = zeros(n,2);
dgroup = (1/n)*sum(vel);
angle = atan(dgroup(2)/dgroup(1));
angle = angle + (pi/2);
cof = sum(pos)/n;
a = -tan(angle);
b = 1;
c = -cof(2) + cof(1)*tan(angle);
denom = sqrt (a^2 + b^2);

projection(:,1) = (a.*pos(:,1) + b.*pos(:,2) + c.*ones(n,1))./denom;
projection(:,2) = (1:n)';

order = sortrows(projection);
order = flipdim(order,1);
r = order(:,2);


end


