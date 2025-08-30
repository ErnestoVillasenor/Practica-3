clc; clear; close all;

tiempo = [0 10];  
estado_ini = [0; 0; 0; 0];

modo = 1;
[t_a, resp_a] = ode45(@(t, y) MVT(t, y, modo), tiempo, estado_ini);

modo = 2;
[t_b, resp_b] = ode45(@(t, y) MVT(t, y, modo), tiempo, estado_ini);

figure;

subplot(2,1,1); 
plot(t_a, resp_a(:,1), 'b-', 'LineWidth', 1.8); hold on;
plot(t_a, resp_a(:,2), 'm--', 'LineWidth', 1.5);
xlabel('Tiempo [s]');
ylabel('Desplazamiento [m]');
legend('Carrocería (x_1)', 'Rueda (x_2)', 'Location', 'best');
title('Caso 1: Entrada z_1(t) = 0.05·sin(0.5\pi t)');
grid minor;

subplot(2,1,2);
plot(t_b, resp_b(:,1), 'g-', 'LineWidth', 2); hold on;
plot(t_b, resp_b(:,2), 'k-.', 'LineWidth', 1.5);
xlabel('Tiempo [s]');
ylabel('Desplazamiento [m]');
legend('Carrocería (x_1)', 'Rueda (x_2)', 'Location', 'best');
title('Caso 2: Entrada z_2(t) = 0.05·sin(20\pi t)');
grid on;
