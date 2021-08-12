clc, clear

ft = @(x, rho) (sqrt(max(0, x-(1 - sqrt(rho))^2).*max(0, (1 + sqrt(rho))^2-x)) ./ (2 * pi * rho * x + eps));
%% Theoretical pdf
rhos = [0.3, 0.6, 1.0, 1.3, 1.6];
figure;
hold on;
for rho = rhos
    x = linspace(0, 5, 1000);
    F = ft(x, rho);
    plot(x, F, 'LineWidth', 1, 'DisplayName', sprintf(" \\rho = %.1f", rho));
end
xlim([0, 5]); ylim([0, 1.5]);
xlabel('x'); ylabel('\mu(dx)');
legend
hold off;

%% Emperical pdf
rho = 0.3;
n = 1000;
m = ceil(n/rho);
X = randn(m, n);
S = X' * X / m;
[g, z] = hist(eig(S), linspace(0, 5, 50));
figure;
bar(z, g/trapz(z, g), 'DisplayName', 'Theoretical PDF');
hold on
x = linspace(0, 5, 1000);
plot(x, ft(x, rho), 'LineWidth', 1, 'DisplayName', 'Numerical PDF');
xlim([0, 5]); ylim([0, 1.5]);
xlabel('\lambda'); ylabel('f(\lambda)');
title('\rho=0.3')
legend
hold off;
