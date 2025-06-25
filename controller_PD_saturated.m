function u = controller_PD_saturated(q, q_desired, omega, Kp, Kd, Jw, max_torque)
q_err = quatmultiply(quatconj(q_desired'), q');
angle_err = q_err(2:4)';

torque_cmd = Kp .* angle_err - Kd .* omega;
torque_cmd = max(min(torque_cmd, max_torque), -max_torque);
u = -Jw \ torque_cmd;
end
