function [x, P, Q, R] = ekf_initialize()
x = [1; 0; 0; 0];
P = eye(4) * 0.01;
Q = eye(4) * 1e-5;
R = eye(4) * 1e-3;
end
