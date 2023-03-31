options = odeset('Refine', 1000);
tspan = [0 15];

initial_point = [3, 0];

[t, y] = ode15s(@mass_spring_sliding_known, tspan, initial_point, options);
figure("Name", "Simulation of system, sliding controller, known f")
plot(t, y);
legend(["position (m)", "velocity (m/s)"]);
xlabel("time (seconds)");
saveas(gcf, [pwd '/figs/time_chart_sliding_known.png']);
figure("Name", "Phase plot of simulation, sliding controller, known f")
plot(y(:, 1), y(:, 2));
xlabel("x_1");
ylabel("x_2");
saveas(gcf, [pwd '/figs/phase_plot_sliding_known.png']);

[t, y] = ode15s(@mass_spring_sliding_unknown, tspan, initial_point, options);
figure("Name", "Simulation of system, sliding controller, unknown f")
plot(t, y);
legend(["position (m)", "velocity (m/s)"]);
xlabel("time (seconds)");
saveas(gcf, [pwd '/figs/time_chart_sliding_unknown.png']);
figure("Name", "Phase plot of simulation, sliding controller, unknown f")
plot(y(:, 1), y(:, 2));
xlabel("x_1");
ylabel("x_2");
saveas(gcf, [pwd '/figs/phase_plot_sliding_unknown.png']);

options = odeset('Refine', 1000,'NormControl','on');

[t, y] = ode15s(@mass_spring_luapunov_known, tspan, initial_point, options);
figure("Name", "Simulation of system, luapunov controller, known f")
plot(t, y);
legend(["position (m)", "velocity (m/s)"]);
xlabel("time (seconds)");
saveas(gcf, [pwd '/figs/time_chart_luapunov_known.png']);
figure("Name", "Phase plot of simulation, luapunov controller, known f")
plot(y(:, 1), y(:, 2));
xlabel("x_1");
ylabel("x_2");
saveas(gcf, [pwd '/figs/phase_plot_luapunov_known.png']);

[t, y] = ode15s(@mass_spring_luapunov_unknown, tspan, initial_point, options);
figure("Name", "Simulation of system, luapunov controller, unknown f")
plot(t, y);
legend(["position (m)", "velocity (m/s)"]);
xlabel("time (seconds)");
saveas(gcf, [pwd '/figs/time_chart_luapunov_unknown.png']);
figure("Name", "Phase plot of simulation, luapunov controller, unknown f")
plot(y(:, 1), y(:, 2));
xlabel("x_1");
ylabel("x_2");
saveas(gcf, [pwd '/figs/phase_plot_luapunov_unknown.png']);
