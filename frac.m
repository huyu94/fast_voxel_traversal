function [x_frac] = frac(x)
    x_frac = 0.0;
    if x>=0
        x_frac = x - floor(x);

end

