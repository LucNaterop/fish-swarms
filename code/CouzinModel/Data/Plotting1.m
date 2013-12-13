
%Averages = averages/600;
h = bar(1,Averages(1));
set(h,'Facecolor','blue');
hold on;
h = bar(2,Averages(2));
set(h,'Facecolor','red');
hold on;
h = bar(3,Averages(3));
set(h,'Facecolor','cyan');
hold on;
h = bar(4,Averages(4));
set(h,'Facecolor','green');
hold on;
ylabel('Average time duration [min]','FontSize',13)


%{
for i=1:10
h = bar(i,TimeToFood1(i)/600);
set(h,'Facecolor','blue');
hold on;
end

for i=1:10
h = bar(i+10,TimeToFood2(i)/600);
set(h,'Facecolor','red');
hold on;
end

for i=1:10
h = bar(i+20,TimeToFood3(i)/600);
set(h,'Facecolor','cyan');
hold on;
end

for i=1:10
h = bar(i+30,TimeToFood4(i)/600);
set(h,'Facecolor','green');
hold on;
end

ylabel('time duration [min]','FontSize',15)
%}