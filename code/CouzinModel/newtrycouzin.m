clear;
RandStream.setGlobalStream(RandStream('mt19937ar','seed',10)); 

steps = 4000;       % Cycles
treshold = 1500;

expanseMatrixF = zeros(4,steps);
polMatrixF = zeros(4,treshold);
angMatrixF = zeros(4,treshold);
TimeToFood = zeros(1,4);


for index=1:4

n = 128;            % Population size
dt = 0.1;           % Length of timestep
size = 5*sqrt(n);   % Plotting size
theta = 0.8727*dt;  % Maximum turning angle
sigma = 0.05;       % Standard deviation for parameters

food = [100,0];      % Food location
w = 0.5;            % weighing factor for food
m = 5;              % every 4th knows about food.

plotting = true;

deltaZoo = 0;
if index == 1
    deltaZoo = 2;   % Swarm structure
elseif index == 2
    deltaZoo = 5;   % Torus structure
elseif index == 3
    deltaZoo = 9;   % Dynamic parallel group
elseif index == 4
    deltaZoo = 13;  % Highly parallel group
end

zor = randn(n,1)*sigma + 1;     % Parameters drawn from Gaussian with means after plus sign
zoo = randn(n,1)*sigma + deltaZoo;     %
zoa = randn(n,1)*sigma + 15;    %
speed = randn(n,1)*sigma+2;     %


pos = 3*sqrt(n)*(rand(n,2)-1/2);        % Initial conditions
vel = zeros(n,2);                       %
for i=1:n                               %
    p = 2*pi*randn();                   % angle p of velocity is drawn from gaussian
    vel(i,:) = [cos(p),sin(p)];         %
end                                     %


% The following are the IC for torus. Set zoo to 10 and theta =
% 0.8727*0.6*dt and speed to 4
%{
for i=1:n
    p = 2*pi*rand();
    pos(i,:) = (6+10*rand())*[cos(p),sin(p)];
    vel(i,:) = [-sin(p),cos(p)];
end
%}

distmat=zeros(n,2);                     % Preallocating
%e = zeros(1,steps);                     %

if plotting
% Initialise figure and draw initial swarm
figure(1);
set(gcf,'Renderer','OpenGL'); 
h = plot(pos(:,1),pos(:,2),'*','MarkerSize',3,'MarkerFaceColor','b');
set(h,'EraseMode','normal');
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');

xlim([-50,50]);
ylim([-50,50]);
end
%{
writerObj = VideoWriter('swarm.avi');
writerObj.Quality = 75;
open(writerObj);
%}

for t=1:steps % Time loop
    
    disp(t);
    
    for j=1:n   % Computes desired direction and velocity for individual j
        
        
        % Stop when swarm reaches food
        if norm(food-pos(j,:)) < 3 && TimeToFood(index) == 0
            TimeToFood(index) = t;
        end
        
        
        distmat(:,1)=(pos(:,1)-pos(j,1));   % Distmat stores all the distances to individual j from the others
        distmat(:,2)=(pos(:,2)-pos(j,2));   %     
        mag=sqrt(sum(abs(distmat).^2,2));   % Computes magnitudes of distances
                      
        dr = [0,0];                                         % Compute the components of di
        da = [0,0];                                         % needed for di
        d0 = [0,0];                                         %
        flag = 0;                                           %
                                                            %
        for k = 1:n                                         %
            if mag(k)>0                                     %
                if mag(k) <= zor(k)                         %
                    dr = dr - (distmat(k,:)/mag(k));        %
                    flag = 1;                               %
                elseif (flag==0 && mag(k)<=zoo(k))          %
                    d0 = d0 + vel(k,:)/norm(vel(k,:));      %
                elseif (flag==0 && mag(k)<=zoa(k))          %
                    da = da + (distmat(k,:)/mag(k));        %
                end                                         %
            end                                             %
        end                                                 %
                                                            
                                                            
        if flag == 1                                        % Compute di
            di = dr;                                        %
        elseif(norm(da)==0)                                 %
            di = d0;                                        %
        elseif (norm(d0)==0)                                %
            di = da;                                        %
        elseif (norm(d0)==0) && (norm(da)==0)               %
            di = vel(j,:);                                  %
        else                                                %
            di = 0.5*(d0 + da);                             %
        end                                                 %
        
        
        if t == treshold
            food = [200,0] + mean(pos);
        end
        if t > treshold
            di = di/norm(di);                               % Food influence on di
            foodvector = food-pos(j,:);                     %
            di = (di + w*foodvector/norm(foodvector));      %
        end
        
        signum = sign(vel(j,1)*di(2)-di(1)*vel(j,2));               % Compute direction of the angle
        dotprod = dot(di,vel(j,:));                                 % Dotproduct (needed for angle)
        phi = real(signum*acos(dotprod/norm(di)/norm(vel(j,:))));   % Compute angle
        
        
        if abs(phi) <= theta % Then rotate by alpha                                                         % Update velocity
            vel(j,:) = transpose([cos(phi),-sin(phi);sin(phi),cos(phi)]*transpose(vel(j,:)));               %
        elseif phi < theta% Rotate by theta                                                                 %
            vel(j,:) = transpose([cos(-theta),-sin(-theta);sin(-theta),cos(-theta)]*transpose(vel(j,:)));   %
        else                                                                                                %
            vel(j,:) = transpose([cos(theta),-sin(theta);sin(theta),cos(theta)]*transpose(vel(j,:)));       %
        end                                                                                                 %
    end
  
    pos = pos+vel*speed(k)*dt;  % Update all positions
    
    %{
    h = plot(pos(:,1),pos(:,2),'*','MarkerSize',3);
    xlim([-20,100]);
    ylim([-40,40]);
    hold on;
    h = rectangle('Position',[food(1),food(2),2,2],'FaceColor','r');
    hold off;
    %}
    
    if plotting
    set(h,'XData',pos(:,1),'YData',pos(:,2));   %Plot
    drawnow;                                    %
    end
    %{
    if(t > 30) 
    writeVideo(writerObj,getframe);             %
    end
    pause(0.01);
    %}

    % Getting data
    if t <= treshold
    polMatrixF(index,t)= (1/length(vel))*norm(sum(vel));       %
    angMatrixF(index,t) = AngularMomentum (pos,vel);           %
    end
    expanseMatrixF(index,t) = expanse(pos);                    %
   
        
end

end

