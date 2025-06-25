I = diag([0.05, 0.07, 0.06]);
Jw = 0.001 * eye(3);
Kp = [0.08; 0.08; 0.08];
Kd = [0.02; 0.02; 0.02];
max_torque = 0.005;
disturbance = [1e-5; -1e-5; 2e-5];
q_desired = [1; 0; 0; 0];

q0 = angle2quat(deg2rad(10), deg2rad(5), deg2rad(-8), 'ZYX')';
X0 = [q0; zeros(6,1)];
tspan = [0 100];

[t, X] = ode45(@(t, X) ...
    dynamics_model_quaternion(t, X, ...
    controller_PD_saturated(X(1:4), q_desired, X(5:7), Kp, Kd, Jw, max_torque), ...
    I, disturbance), tspan, X0);

plot_results_quat(t, X(:,1:4), q_desired);
animate_3D_attitude_gif(t, X(:,1:4));
