
function result = FRAC1(x,grid_size)
    if(mod(x,grid_size) == 0)
        result = grid_size;
    else
        result = mod((1 - x +floor(x)),grid_size);
    end
end