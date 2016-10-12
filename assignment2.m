%% ENEL 671 Assingment 2
%%
r = [2 1 0.75 0.5 0.25]; 
R = toeplitz(r);
R_fifth_order = toeplitz(r);

R_second_order = R(1:2,1:2);
R_third_order = R(1:3,1:3);
R_fourth_order = R(1:4,1:4);

[V5, D5] = eig(R_fifth_order);
[V4, D4] = eig(R_fourth_order);
[V3, D3] = eig(R_third_order);
[V2, D2] = eig(R_second_order);

eig_spread_5 = max(D5(:))/min(D5(D5 > 0));
eig_spread_4 = max(D4(:))/min(D4(D4 > 0));
eig_spread_3 = max(D3(:))/min(D3(D3 > 0));
eig_spread_2 = max(D2(:))/min(D2(D2 > 0));


%% Part 2 
% Calculate weights for each filter order
P = [0.5 0.25 0.125 0.0625 0.03125]';
size = 5;
sigma_squared = 1.0;

invR = inv(R);
W2 = inv(R(1:2,1:2))*P(1:2);     
W3 = inv(R(1:3,1:3))*P(1:3);
W4 = inv(R(1:4,1:4))*P(1:4);
W5 = inv(R(1:5,1:5))*P(1:5);

MMSE2 = sigma_squared - W2'*P(1:2);
MMSE3 = sigma_squared - W3'*P(1:3);
MMSE4 = sigma_squared - W4'*P(1:4);
MMSE5 = sigma_squared - W5'*P(1:5);
