%matlabpool open 4;

steps = 1800;
expanseMatrixN = zeros(4,steps);
timeVector = zeros(1,4);

for i = 2:5
    disp('starting');
    disp(2^i);
    tic;
    expanseMatrixN(i-1,:) = SwarmSimulation(2^i);
    timeVector(i-1) = toc;
    disp(2^i);
    disp('finished');
end

csvwrite('ExpanseMatrixN',expanseMatrixN);

%matlabpool close;

