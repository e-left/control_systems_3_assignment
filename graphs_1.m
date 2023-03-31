k = 5;
m = 1;
mi = 0.75;
g = 9.81;
alpha = m * g * mi / k;

syms f1(x);
syms f2(x);

figure("Name", "Phase plot");
title("Phase Portrait");
for c=0:3
    f1(x) = sqrt(c - x^2 - 2 * alpha * x);
    f2(x) = - sqrt(c - x^2 + 2 * alpha * x);

    fplot(f1);
    hold on;
    fplot(f2);
    hold on;
end
xlabel("x_1");
ylabel("x_2");
legend("x_2 > 0, c = 0", "x_2 < 0, c = 0", "x_2 > 0, c = 1", "x_2 < 0, c = 1", ...
    "x_2 > 0, c = 2", "x_2 < 0, c = 2", "x_2 > 0, c = 3", "x_2 < 0, c = 3");

saveas(gcf, [pwd '/figs/phase_portrait.png']);
