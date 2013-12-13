classdef Fish < handle
    properties
        pos     %Vector of the fish's position.
        vel     %Vector of the fish's velocity.
        acc     %Vector of the fish's acceleration.
        mass    %The fish's mass. 
        IN      %Amount of influental neighbours.
        color
    end
    
    methods
        function obj = Fish(xrand,yrand,n)
            %RandStream.setGlobalStream(RandStream('mt19937ar','seed',10)); 

            obj.pos(1) = 3*xrand*sqrt(n);
            obj.pos(2) = 3*yrand*sqrt(n);

            obj.IN = 1;
            %obj.vel = 6/sqrt(2)*rand(1,2);
            obj.color = '*b';
        end
        
        function plot(fish)
            plot(fish.pos(1),fish.pos(2),fish.color);
            %p2 = fish.pos - fish.vel/(2*norm(fish.vel));
            %plot([fish.pos(1),p2(1)],[fish.pos(2),p2(2)],fish.color);
        end
        
        function F = forceOf(i,f1,swarm,neighbours,parameters)
            F=0;
            if ~isnan(norm(f1.pos))
                pos=zeros(length(swarm)-1,2);
                for k=1:length(swarm)
                    if(f1.pos~=swarm(k).pos)
                       pos(k,1)=norm(f1.pos-swarm(k).pos);
                       pos(k,2)=k;
                    end
                end
                
                pos( ~any(pos,2), : ) = [];
                a1=length(pos);
                %sorting row vectors of pos matrix to get n closest neighbours
                %sortedpos=sortrows(pos);
                
                %extracting 'neighbours' smallest distances
                for a=1:neighbours
                    for b=a+1:a1
                        if(pos(a,1)>pos(b,1))
                            %swap
                            temp=pos(b,:);
                            pos(b,:)=pos(a,:);
                            pos(a,:)=temp;
                        end
                    end
                end
                                           
                
                %compute forces
                
                forces=zeros(neighbours,2);
                for k=1:neighbours
                    actual_diff=f1.pos-swarm(pos(k,2)).pos;
                    unit=-1*actual_diff/norm(actual_diff);
                    if(pos(k,1)<parameters(1))
                        forces(k,:)=(parameters(5)*pos(k,1)-parameters(7))*unit;
                    else if(pos(k,1)<parameters(3) && pos(k,1)>parameters(2))
                            forces(k,:)=(parameters(6)*pos(k,1)-parameters(6)*parameters(2))*unit;
                        else if(pos(k,1)<=parameters(4) && pos(k,1)>=parameters(3))
                                forces(k,:)=parameters(7)*unit;
                          
                        end
                    end
                    F=F+forces(k,:);
                    end
                end
            end
         end
        
        function update(i, fish,swarm,neighbours,parameters,object,object2,food,food2, line)
            dt = 0.01;
            for k=1:length(swarm)
                if(i~=k) 
                    fish.acc = forceOf(i,fish,swarm,neighbours,parameters);
                    fish.vel = fish.vel + fish.acc*dt;
                    fish.acc = fish.acc;
                    fish.vel = fish.vel + fish.acc*dt;
                    fish.pos = fish.pos + fish.vel*dt;
                end
            end
             fish.acc = forceBetween(object,fish)+ forceBetween(object2,fish) + forceBetween(food,fish, i) + forceBetween(food2,fish, i);  %lineForce(line,fish);
             fish.vel = fish.vel + fish.acc*dt;
             fish.pos = fish.pos + fish.vel*dt;
        end
        
        function update2(i, fish,swarm,neighbours,parameters)
            dt = 0.033;

            fish.acc = forceOf(i,fish,swarm,neighbours,parameters) + parameters(7)/6*(2*rand(1,2) - 1);
                    
            fish.vel = fish.vel + fish.acc*dt;
            fish.pos = fish.pos + fish.vel*dt;
        end
        
    end
end

