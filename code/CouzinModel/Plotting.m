Averages = averages;
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


ylabel('average time duration [s]','FontSize',15)
