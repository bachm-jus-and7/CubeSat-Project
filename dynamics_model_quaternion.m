function dX = dynamics_model_quaternion(t, X, u, I, disturbance)
q = X(1:4);
omega = X(5:7);
omega_wheel = X(8:10);
Jw = 0.001 * eye(3);

torque = -Jw * u;
omega_dot = I \ (torque + disturbance - cross(omega, I*omega));

Omega = [0 -omega(1) -omega(2) -omega(3);
         omega(1) 0 omega(3) -omega(2);
         omega(2) -omega(3) 0 omega(1);
         omega(3) omega(2) -omega(1) 0];
dq = 0.5 * Omega * q;

d_omega_wheel = u;
dX = [dq; omega_dot; d_omega_wheel];
end
