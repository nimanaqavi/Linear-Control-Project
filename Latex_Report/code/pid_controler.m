clc; clear; close all;

G = tf(0.01, [1, 0.004518]);

%% first design
Kp1 = 150; 
Ki1 = 10; 
Kd1 = 10;

C_PID_Sum = pid(Kp1, Ki1, Kd1);
Sys_PID_Sum = feedback(C_PID_Sum * G, 1);

%% secend design
Kp2 = 400;  
Ki2 = 50; 
Kd2 = 50;   

C_PID_Fast = pid(Kp2, Ki2, Kd2);
Sys_PID_Fast = feedback(C_PID_Fast * G, 1);

%%
t = 0:0.001:20;
figure(1);
plot(t, step(Sys_PID_Sum, t), 'b--', 'LineWidth', 1.5); hold on;
plot(t, step(Sys_PID_Fast, t), 'r-', 'LineWidth', 2);
yline(1, 'k:');

legend(['Initial PID (Kp=' num2str(Kp1) ')'], ...
       ['Tuned PID (Kp=' num2str(Kp2) ')']);
title('Effect of Increasing Kp on System Speed');
xlabel('Time (s)'); ylabel('Amplitude');
grid on;
