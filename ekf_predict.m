function [x_pred, P_pred] = ekf_predict(x, P, omega, Q, dt)
Omega = [0 -omega(1) -omega(2) -omega(3);
         omega(1) 0 omega(3) -omega(2);
         omega(2) -omega(3) 0 omega(1);
         omega(3) omega(2) -omega(1) 0];
A = 0.5 * Omega;
x_pred = x + A * x * dt;
x_pred = x_pred / norm(x_pred);
P_pred = A * P * A' + Q;
end
