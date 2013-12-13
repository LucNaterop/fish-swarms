function [expanse, packdensity]=expanseOOP(swarm)
n = length(swarm);
mean = 0;
for i=1:n
    mean = mean + swarm(i).pos;
end
mean = mean/n;
expanse = 0;
for i=1:n
    delta = swarm(i).pos-mean;
    expanse = expanse + sqrt(delta(1)^2 + delta(2)^2);
end
expanse = expanse/n;
packdensity = expanse/n;
end

