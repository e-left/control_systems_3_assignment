function dotvector = mass_spring_luapunov_unknown(t, x)
%MASS_SPRING_SYSTEM 
    m = 1;
    k = 5;
    g = 9.81;
    mi = 0.75;  
    x1 = x(1);
    x2 = x(2);

    mbar = 1.25;
    
    sat = @(s) min(max(s, -1), 1);
   
    alpha = - mi * m * g * sign(x2 + trajectory_dot(t) - spring_force(x1, t) - m * trajectory_dot_dot(t));
    alphabar = - mi * mbar * g * sat(x2 + trajectory_dot(t) - fbar_unknown(x1, t) - mbar * trajectory_dot_dot(t));
    betabarinv = mbar;
    b = [0; 1];
    
    F = [1; 1];
    P = [1.5, 0.5; 0.5, 1];

    epsilonbar = abs(mbar / m - 1);

    dv = - ((epsilonbar * abs(F' * x) + (alphabar - alpha) / m) / (1 - epsilonbar)) * sat(x' * P * b);

    u = alphabar + betabarinv * (- F' * x + dv);

    x_dot_1 = x2;

    x_dot_2 = (1 / m) * (u - alpha);

    if abs(x_dot_1) < 1e-8
        dotvector = [0; x_dot_2];
    else
        dotvector = [x_dot_1; x_dot_2];
    end
end

