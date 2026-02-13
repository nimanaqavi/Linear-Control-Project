clc; clear; close all;

num = 0.01;
den = [1, 0.004518];
G = tf(num, den);

Target_Ts = 4;     
Target_OS = 15;    

%% p controler
Kp_p = 20 ; 
C_p = pid(Kp_p, 0, 0);
Sys_P = feedback(C_p * G, 1);

figure(1);
step(Sys_P); title('Step 1: P Controller Response'); grid on;
info_P = stepinfo(Sys_P);

%% pd controler
Kp_pd = 100;
Kd_pd = 10; 
C_pd = pid(Kp_pd, 0, Kd_pd);
Sys_PD = feedback(C_pd * G, 1);

figure(2);
step(Sys_PD); title('Step 2: PD Controller Response'); grid on;
info_PD = stepinfo(Sys_PD);

%% pi controler
Kp_pi = 50;
Ki_pi = 10; 
C_pi = pid(Kp_pi, Ki_pi, 0);
Sys_PI = feedback(C_pi * G, 1);

figure(3);
step(Sys_PI); title('Step 3: PI Controller Response'); grid on;
info_PI = stepinfo(Sys_PI);
