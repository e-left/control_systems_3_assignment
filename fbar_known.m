function fval = fbar_known(x, t)
    nom = (11 - 10 * exp(-0.05 * t)) * (x^2 + 1) + (4.25 - 4 * exp(-0.02 * t)) * (0.5 * x^2 + 1);
    fval = (nom) / 2;
end

