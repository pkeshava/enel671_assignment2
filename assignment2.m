%% ENEL 671 Assingment 2
% Pouyan Keshavarzian
% ENEL 671
%%
% Calculate eigenvalues for each set of 
R = [2 1 0.75 0.5 0.25]; 

for M=2:5  
    [V, D]= eig(R(1:M,1:M));
    eigenvalue_spread(M-1)= max(max(diag(D)))/min(min(diag(D)));
    % Property of the autocorelation matrix is that the sum of the
    % eigenvectors is the trace of the matrix
    TraceR(M-1)=sum(diag(D));
end

UpBoundStepSize=2./TraceR;

%% Part 2 
% Calculate weights for each filter order
p = [0.5 0.25 0.125 0.0625 0.03125]';
sigma_squared = 1.0;

invR = inv(R);
w2 = inv(R(1:2,1:2))*p(1:2);     
w3 = inv(R(1:3,1:3))*p(1:3);
w4 = inv(R(1:4,1:4))*p(1:4);
w5 = inv(R(1:5,1:5))*p(1:5);

MMSE2 = sigma_squared - w2'*p(1:2);
MMSE3 = sigma_squared - w3'*p(1:3);
MMSE4 = sigma_squared - w4'*p(1:4);
MMSE5 = sigma_squared - w5'*p(1:5);