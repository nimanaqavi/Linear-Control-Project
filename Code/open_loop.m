clc; clear; close all;

%% 1. Parameters & Operating Point
Area = 100;
g = 9.8;
a_valve = 0.5;
H0 = 6; % Operating Point

% Equilibrium Inflow
Q0 = a_valve * sqrt(2 * g * H0);

fprintf('--- Operating Point ---\nH0: %.2f m | Q0: %.2f m^3/s\n\n', H0, Q0);

%% 2. Linearization
A_lin = -(a_valve * sqrt(2*g)) / (2 * Area * sqrt(H0));
B_lin = 1 / Area;
C_lin = 1; D_lin = 0;

sys_linear = ss(A_lin, B_lin, C_lin, D_lin);

% *** Calculate Time Constant (Fixing the Error) ***
tau = -1 / A_lin; 

fprintf('--- Model Stats ---\n');
tf(sys_linear)
fprintf('Time Constant (tau): %.2f s\n', tau);

%% 3. Absolute Step Response
figure(1);
opt = stepDataOptions('StepAmplitude', 1); 
[y_dev, t_out] = step(sys_linear, opt);

% Add operating point to deviation
H_total = y_dev + H0; 

plot(t_out, H_total, 'LineWidth', 2);
title(['Absolute Step Response (H0=' num2str(H0) 'm)']);
xlabel('Time (s)'); ylabel('Height (m)'); grid on;

%% 4. Impulse & Ramp Response
% A) Impulse
figure(2);
impulse(sys_linear);
title('Impulse Response'); grid on;

% B) Ramp
t_sim = 0:10:(3 * tau); % Uses calculated tau
u_ramp = t_sim; 
[y_ramp, t_out] = lsim(sys_linear, u_ramp, t_sim);

figure(3);
plot(t_out, u_ramp, 'r--', t_out, y_ramp, 'b-', 'LineWidth', 2);
legend('Input', 'Output'); title('Ramp Response'); grid on;

%% 5. System Structure
poles = pole(sys_linear);
type = sum(abs(poles) < 1e-6);

fprintf('\n--- Structure ---\nOrder: %d\nType: %d\nPole: %.4f\n', length(poles), type, poles);