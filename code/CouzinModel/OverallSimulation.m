matlabpool open 4;

Simulations = 10;
T = zeros(1,Simulations);

parfor i=1:Simulations
    disp('Simulation: ');
    disp(i);
    T(i) = newtrycouzin;
end

disp('done');

csvwrite('TimeToFood1.csv',T);
bar(T);

matlabpool close;