function a = AngularMomentum(pos,vel)
n = length(pos);
cof = sum(pos)/n;
vel = [vel,zeros(n,1)];
ric = [pos(:,1)-cof(1), pos(:,2)-cof(2), zeros(n,1)];
b = abs(sum(cross(ric,vel)))/n;
a = b(3);
end