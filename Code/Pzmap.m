clc; clear; close all;

tau = 221.31; 
sys = tf(0.01, [1, 1/tau]);

figure(1);
pzmap(sys);
title('Pole-Zero Map of the System (H0=6m)');
grid on;


