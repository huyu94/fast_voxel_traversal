function result = FRAC0(x,grid_size)
    if(mod(x/grid_size) == 0)
        result = grid_size;
    else
        result = mod((x-floor(x)),grid_size);
    end
end