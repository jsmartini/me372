clc; clear;


%problem 1
linspace(1,5, 100);
% linspace creates an evenly distributed vector of size n through start ->
% finish:: linspace(start, finish, n)

%problem 2
t = linspace(1,10,749);
[y, param] = x(t);

plot(t, y)
title(sprintf("d_ratio: %f, omegaN: %f, omegaD: %f, x0: %f, v0: %f", param));
xlabel("t: seconds")
ylabel("x(t): cm")
vec = sprintf("700th vec entry:\t %d", y(700));
disp(vec)


function [out, val] = x(t)
    damping_ratio = 0.06;
    omega_n = 5; %rad/sec
    omega_d = omega_n * sqrt(1 - damping_ratio^2); %rad/sec
    x0 = 0; %cm
    v0 = 3; %cm/s
    calc = @(t) exp(-damping_ratio .* omega_n .* t) .* (x0.*cos(omega_d.*t)  ...
                + ((v0 + damping_ratio*omega_n)./omega_d).*sin(omega_d .* t));
    val = [damping_ratio omega_n omega_d x0 v0];
    out = calc(t);
end