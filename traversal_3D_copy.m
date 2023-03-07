function visitied_voxels = traversal_3D_copy()
    x1 = 0;
    y1 = 0;
    z1 = 0;
    x2 = 3;
    y2 = 8;
    z2 = 10;
    voxel = zeros(1,3);
    visitied_voxels = [];
    
%   axis X
    dx = sign(x2-x1);
    if (dx ~= 0)
        tDeltaX = min(dx / (x2 - x1), 100000.0);
    else
        tDeltaX = 100000.0;
    end
%     if(dx > 0) 
%         tMaxX = tDeltaX * FRAC1(x1);
%     else
%         tMaxX = tDeltaX * FRAC0(x1);
%     end
    tMaxX = tDeltaX * FRAC(x1);
    voxel(1) = floor(x1);

%   axis Y
    dy = sign(y2 - y1);
    if (dy ~= 0) 
        tDeltaY = min(dy / (y2 - y1), 10000000.0); 
    else 
        tDeltaY = 10000000.0;
    end
%     if (dy > 0) 
%         tMaxY = tDeltaY * FRAC1(y1); 
%     else 
%         tMaxY = tDeltaY * FRAC0(y1);
%     end
    tMaxY = tDeltaY * FRAC(y1);
    voxel(2) = floor(y1) ;
%   axis Z

    dz = sign(z2 - z1);
    if (dz ~= 0) 
        tDeltaZ = min(dz / (z2 - z1), 10000000.0);
    else 
        tDeltaZ = 10000000.0;
    end
%     if (dz > 0)
%         tMaxZ = tDeltaZ * FRAC1(z1); 
%     else 
%         tMaxZ = tDeltaZ * FRAC0(z1);
%     end
    tMaxZ = tDeltaZ * FRAC(z1);
    voxel(3) = floor(z1);

    while(true)
        if(tMaxX < tMaxY)
            if(tMaxX < tMaxZ)
                voxel(1) = voxel(1) + dx;
                tMaxX = tMaxX + tDeltaX;
            else
                voxel(3) = voxel(3) + dz;
                tMaxZ = tMaxZ + tDeltaZ;
            end
        else
            if(tMaxY < tMaxZ)
                voxel(2) = voxel(2) + dy;
                tMaxY = tMaxY + tDeltaY;
            else
                voxel(3) = voxel(3) + dz;
                tMaxZ = tMaxZ + tDeltaZ;
            end
        end
        visitied_voxels = [visitied_voxels;voxel];
        if(voxel(1) == x2 && voxel(2) == y2 && voxel(3) == z2)
            return 
        end
    end
end

function result = FRAC(x)
    if(x<0)
        result = FRAC(-x);
    else
        result = x - floor(x);
    end
end

function result = FRAC0(x)
    result = x - floor(x);    
end

function result = FRAC1(x)
    result = 1 - x + floor(x);    
end
