function dotvector = mass_spring_system(t, x)
%MASS_SPRING_SYSTEM 
    m = 1;
    k = 5;
    g = 9.81;
    mi = 0.75;  
    x1 = x(1);
    x2 = x(2);

    x_dot_1 = sqrt(k / m) * x2;
    x_dot_2 = - sqrt(k / m) * x1 - mi * g * sqrt(m / k) * sign(x2);
    if abs(x_dot_1) < 1e-8 && ((x_dot_1 > 0 && x(1) >= - mi * m * g / k) || ((x_dot_1 < 0 && x(1) <= mi * m * g / k)))
        dotvector = [0; 0];
    else
        dotvector = [x_dot_1; x_dot_2];
    end
end

