t = linspace(0,150,4000);
h = plot(t,expanse1(1,:),'Color', [1.0, 0, 0.0]);
set(h,'LineWidth',2)
hold on;
h = plot(t,expanse1(2,:),'Color', 'yellow');
set(h,'LineWidth',2)
hold on;
h = plot(t,expanse1(4,:),'Color', [0.5, 1.0, 0.0]);
set(h,'LineWidth',2)
hold on;
h = plot(t,expanse1(5,:),'Color', [0.0, 1.0, 1.0]);
set(h,'LineWidth',2)
hold on;
h = plot(t,expanse1(8,:)-1,'Color', [0.0, 0.5, 1.0]);
set(h,'LineWidth',2)
hold on;
h = plot(t,expanse1(9,:)-1,'Color','blue');
set(h,'LineWidth',2)
hold on;
h = plot(t,expanse1(10,:)-1,'Color', [1.0, 0.5, 0.0]);
set(h,'LineWidth',2)
hold on;
h = plot(t,expanse1(9,:)-1,'Color', 'magenta');
set(h,'LineWidth',2)
hold on;

legend('N = 30', 'N = 50', 'N = 70', 'N = 90', 'N = 110', 'N = 130', 'N = 150', 'N =  170', 'location', 'northwest');
grid on;

xlabel('Time [s]', 'FontSize', 13);
ylabel('Expanse [m]', 'FontSize', 13);