clc; clear; close all;

%% تعریف سیستم (نقطه کار H=6m)
sys = tf(0.01, [1, 0.004518]);

%%  تحلیل بود (Bode Plot & Margins)
figure(1);

margin(sys); 
grid on;
title('Bode Diagram with Stability Margins');

[Gm, Pm, Wcg, Wcp] = margin(sys);
Gm_dB = 20*log10(Gm);

%%  تحلیل نایکوئیست (Nyquist Plot)
figure(2);
nyquist(sys);
grid on;
title('Nyquist Diagram');
axis equal;

hold on;
plot(-1, 0, 'rx', 'MarkerSize', 10, 'LineWidth', 2); 
legend('System Nyquist', 'Critical Point (-1,0)');
