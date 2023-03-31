function force = spring_force(x, t)
    force = 5 + 0.6 * exp(-0.045 * t) * x * (1 + 0.9 * x * x);
end

