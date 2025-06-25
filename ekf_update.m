function [x_upd, P_upd] = ekf_update(x_pred, P_pred, z, R)
H = eye(4);
K = P_pred * H' / (H * P_pred * H' + R);
x_upd = x_pred + K * (z - H * x_pred);
x_upd = x_upd / norm(x_upd);
P_upd = (eye(4) - K * H) * P_pred;
end
