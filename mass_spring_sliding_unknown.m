function dotvector = mass_spring_sliding_unknown(t, x)
%MASS_SPRING_SYSTEM 
    m = 1;
    k = 5;
    g = 9.81;
    mi = 0.75;  
    x1 = x(1);
    x2 = x(2);

    mbar = 1.25;
    
    sat = @(s) min(max(s, -1), 1);

    % change these
    c = 20;
    lambda = 10;
    % hope you changed them

    e = x1 - trajectory(t);
    edot = sqrt(k / m) * x2 - trajectory_dot(t);
    s = edot + lambda * e;
   
    u = mbar * (trajectory_dot_dot(t) - lambda * edot + mi * g * sign(x2)) ...
        + (mbar / m) * fbar_unknown(x1, t) ...
        - (abs(mbar - m) * abs(trajectory_dot_dot(t) - lambda * edot + mi * g * sign(x2)) + abs((mbar / m) * fbar_unknown(x1, t) - spring_force(x1, t)) + c ) * sat(s);


    x_dot_1 = sqrt(k / m) * x2;

    x_dot_2 = sqrt(k / m) * u - sqrt(k / m) * fbar_unknown(x1, t) - mi * g * sqrt(m / k) * sign(x2);

    if abs(x_dot_1) < 1e-8
        dotvector = [0; x_dot_2];
    else
        dotvector = [x_dot_1; x_dot_2];
    end
end

