function expanse = SwarmSimulation(x)
RandStream.setGlobalStream(RandStream('mt19937ar','seed',10)); 

%force Set constants
N = 35;         %Amount of individuals
steps = 1800;   %Cycles
dt = 0.033;      %Length of timestep
m = 1;          %steps between plotting
size = 10;      %size of the world
threshold = 2000; %t until no objects appear
neighbours = x;
parameters = [1.88 2.88 5 180 9.35 10.54 102]; %[dr da Dm Dv mr ma Fmax]

eOOP = zeros(1,steps);

%{
% Initialise figure
figure;
xlim([-size size]);
ylim([-size size]);
hold on;
%}

% Initialise Video
%{
writerObj = VideoWriter('swarm.avi');
open(writerObj);
axis tight;
set(gca,'nextplot','replacechildren');
set(gcf,'Renderer','zbuffer');
%}

% Initialise Swarm
for i=1:N
    swarm(1,i) = Fish(rand(),rand(),N);
end

for i=1:N
    swarm(1,i).vel = 6/sqrt(2)*rand(1,2);
end



%{
%Initialise Objects;
%l1 = LineObject([1 5],[0,0]);
c1 = CircleObject(-4,-4,2);
c2 = CircleObject(-4,7,2);

%Initialise Food;
f1 = food([-9 -9]);
f2 = food([-9 9]);
%}

% Plot initial condition
%{
for i=1:N
    plot(swarm(i));
    xlim([-size size]);
    ylim([-size size]);
end
%}

%{
plot(c1);
plot(c2);
plot(f1);
plot(f2);
%}

hold off
pause(1);
disp('Go');

for t=1:steps
    disp(t);
    for i=1:N
        %Update individual i
        update2(i,swarm(i),swarm,neighbours,parameters);
        
        %{
        if (mod(t,m)) == 0
            %Plot very m'th step
            plot(swarm(i));
            hold on;
            xlim([-size size]);
            ylim([-size size]); 
        end
        %}
    end
    
    %{
        frame = getframe;
        writeVideo(writerObj,frame);
      %}  
        eOOP(1,t)=expanseOOP(swarm);
        pause(0.01);
        hold off;   

end
expanse = eOOP;
%close(writerObj);
end
