%% ENEL 671 Assignment 2
% Pouyan Keshavarzian
% ENEL 671
%%
% Define autocorrelation matrix
R = [2 1 0.75 0.5 0.25]; 
R = toeplitz(R);
for M=2:5  
    [V, D]= eig(R(1:M,1:M));
    eigenvalue_spread(M-1)= max(max(diag(D)))/min(min(diag(D)));
    % Property of the autocorelation matrix is that the sum of the
    % eigenvectors is the trace of the matrix
    TraceR(M-1)=sum(diag(D));
end
eigenvalue_spread
UpBoundStepSize=2./TraceR

%% Part 2 
% Calculate weights for each filter order

% Autocovarriance matrix p 
p = [0.5 0.25 0.125 0.0625 0.03125]';
sigma_squared = 1.0;
% Calculate tap-input vectors for corresponding filter coefficeints
w2 = inv(R(1:2,1:2))*p(1:2);     
w3 = inv(R(1:3,1:3))*p(1:3);
w4 = inv(R(1:4,1:4))*p(1:4);
w5 = inv(R(1:5,1:5))*p(1:5);

% Calculate MMSE for corresponding filter coefficeints
MMSE2 = sigma_squared - w2'*p(1:2);
MMSE3 = sigma_squared - w3'*p(1:3);
MMSE4 = sigma_squared - w4'*p(1:4);
MMSE5 = sigma_squared - w5'*p(1:5);

MMSE = [MMSE2 MMSE3 MMSE4 MMSE5]