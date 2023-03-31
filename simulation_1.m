options = odeset('Refine', 1000);
tspan = [0 5];

initial_points = [-5, 0; 3, 0; 0, -5; -6, 6; 4, 6];
for k=1:5
    initial_point = initial_points(k, :);
    [t, y] = ode15s(@mass_spring_system, tspan, initial_point, options);
    figure("Name", sprintf("Simulation #%d of system", k))
    plot(t, y);
    legend(["position (m)", "velocity (m/s)"]);
    xlabel("time (seconds)");
    saveas(gcf, [pwd sprintf('/figs/time_chart_%d.png', k)]);
    figure("Name", sprintf("Phase plot of simulation #%d of system", k))
    plot(y(:, 1), y(:, 2));
    xlabel("x_1");
    ylabel("x_2");
    saveas(gcf, [pwd sprintf('/figs/phase_plot_%d.png', k)]);
end