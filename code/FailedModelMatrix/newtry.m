RandStream.setGlobalStream(RandStream('mt19937ar','seed',10)); 

steps = 1800;   %Cycles

%{
expanseMatrix2 = zeros(4,steps);
timeVector2 = zeros(1,4);

for N = 4:7
tic;
n = 2^N; % pop size
x = 8; %neighbours
parameters = [1.88 2.88 5 180 9.35 10.54 102]; %[dr da Dm Dv mr ma Fmax]
dt = 0.033;      %Length of timestep
size = 100;      %size of the world
m= 0.1; % plot every m dt's
rand_force = 0;
pos = 3*sqrt(n)*rand(n,2); %initial positions
distmat=zeros(n,2);
vel=6/sqrt(2)*rand(n,2);
acc=zeros(n,2);


% Initialise figure
% Draw initial figure
%{
figure(1);
set(gcf,'Renderer','OpenGL'); 
h = plot(pos(:,1),pos(:,2),'*','MarkerSize',10,'MarkerFaceColor','b');
set(h,'EraseMode','normal');
xlim([-size,size]);
ylim([-size,size]);
%}

for t=1:steps
    
    disp(sprintf('%d',t));
    for j=1:n
        distmat=zeros(n,2);
        distmat(:,1)=-1*(pos(:,1)-pos(j,1));
        
        distmat(:,2)=-1*(pos(:,2)-pos(j,2));
        distmat( ~any(distmat,2), : ) = []; 
        
        
        mag=zeros(n-1,2);
        mag(:,1)=sqrt(sum(abs(distmat).^2,2)); %magnitudes
        
        y=1;
        for w=1:n
            if(w~=j)
                mag(y,2)=w; %keeping track of member
                y=y+1;
            end
        end
        
        %sorting by magnitude
            for a=1:x
                    for b=a+1:length(mag)-1
                        if(mag(a,1)>mag(b,1))
                            %swap
                            temp=mag(b,:);
                            mag(b,:)=mag(a,:);
                            mag(a,:)=temp;
                        end
                    end
            end
               
            %compute forces
             F=0;
             forces=zeros(x,2);
                for k=1:x
                    actual_diff=[distmat(mag(k,2),1) distmat(mag(k,2),2)];
                    unit=-actual_diff/norm(actual_diff);
                    if(mag(k,1)<parameters(1))
                        forces(k,:)=(parameters(5)*mag(k,1)-parameters(7))*unit;
                        
                    end
                    if(mag(k,1)<parameters(3) && mag(k,1)>parameters(2))
                            forces(k,:)=(parameters(6)*mag(k,1)-parameters(6)*parameters(2))*unit;
                            
                    end
                    if(mag(k,1)<=parameters(4) && mag(k,1)>=parameters(3))
                                forces(k,:)=parameters(7)*unit;
                                
                          
                    end
                    if(mag(k,1)<parameters(2) && mag(k,1)>parameters(1))
                            forces(k,:)=0;
                          
                    end
                    if(mag(k,1)>parameters(4))
                            forces(k,:)=0;
                    end
                    F=F+forces(k,:);
                end
              rand_force = parameters(7)/6*(2*rand(1,2) - 1); 
              acc(j,:) = F + rand_force;
              vel(j,:) = vel(j,:)+ dt*acc(j,:);
            
              
    end
    
    pos=pos+dt*vel;
    
    %{
    if (mod(t,m)) == 0
        set(h,'XData',pos(:,1),'YData',pos(:,2));
        drawnow;
    end
    %}
    
    timeVector2(N-3) = toc;
    expanseMatrix2(N-3,t) = expanse(pos);
    pause(0.01);
    
end

end
        
        
%}





expanseMatrix2N = zeros(4,steps);


n = 100; % pop size
x = 8; %neighbours
parameters = [1.88 2.88 5 180 9.35 10.54 102]; %[dr da Dm Dv mr ma Fmax]
steps = 1800;   %Cycles
dt = 0.033;      %Length of timestep
size = 100;      %size of the world
m= 0.1; % plot every m dt's
rand_force = 0;

pos = 3*sqrt(n)*rand(n,2); %initial positions
distmat=zeros(n,2);
vel=6/sqrt(2)*rand(n,2);
acc=zeros(n,2);

% Initialise figure
% Draw initial figure
figure(1);
set(gcf,'Renderer','OpenGL'); 
h = plot(pos(:,1),pos(:,2),'*','MarkerSize',10,'MarkerFaceColor','b');
set(h,'EraseMode','normal');
xlim([-size,size]);
ylim([-size,size]);


for t=1:steps
    
    disp(sprintf('%d',t));
    for j=1:n
        distmat=zeros(n,2);
        distmat(:,1)=-1*(pos(:,1)-pos(j,1));
        
        distmat(:,2)=-1*(pos(:,2)-pos(j,2));
        distmat( ~any(distmat,2), : ) = []; 
        
        
        mag=zeros(n-1,2);
        mag(:,1)=sqrt(sum(abs(distmat).^2,2)); %magnitudes
        
        y=1;
        for w=1:n
            if(w~=j)
                mag(y,2)=w; %keeping track of member
                y=y+1;
            end
        end
        
        %sorting by magnitude
            for a=1:x
                    for b=a+1:length(mag)-1
                        if(mag(a,1)>mag(b,1))
                            %swap
                            temp=mag(b,:);
                            mag(b,:)=mag(a,:);
                            mag(a,:)=temp;
                        end
                    end
            end
               
            %compute forces
             F=0;
             forces=zeros(x,2);
                for k=1:x
                    actual_diff=[distmat(mag(k,2),1) distmat(mag(k,2),2)];
                    unit=-actual_diff/norm(actual_diff);
                    if(mag(k,1)<parameters(1))
                        forces(k,:)=(parameters(5)*mag(k,1)-parameters(7))*unit;
                        
                    end
                    if(mag(k,1)<parameters(3) && mag(k,1)>parameters(2))
                            forces(k,:)=(parameters(6)*mag(k,1)-parameters(6)*parameters(2))*unit;
                            
                    end
                    if(mag(k,1)<=parameters(4) && mag(k,1)>=parameters(3))
                                forces(k,:)=parameters(7)*unit;
                                
                          
                    end
                    if(mag(k,1)<parameters(2) && mag(k,1)>parameters(1))
                            forces(k,:)=0;
                          
                    end
                    if(mag(k,1)>parameters(4))
                            forces(k,:)=0;
                    end
                    F=F+forces(k,:);
                end
              rand_force = parameters(7)/6*(2*rand(1,2) - 1); 
              acc(j,:) = F + rand_force;
              vel(j,:) = vel(j,:)+ dt*acc(j,:);
              if norm(vel(j,:)) > 12
                  vel(j,:) = 12*vel(j,:)/norm(vel(j,:));
              end
            
    end
    
    pos=pos+dt*vel;
    
    if (mod(t,m)) == 0
        set(h,'XData',pos(:,1),'YData',pos(:,2));
        drawnow;
    end
    expanseMatrix2N(N-1,t) = expanse(pos);
    pause(0.01);
    
end
    

