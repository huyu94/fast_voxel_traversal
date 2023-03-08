function visitied_voxels = traversal_2D(ray_start,ray_end,boundary)
%   boundary = [x_min,x_max,y_min,y_max,z_min,z_max]
%   初始设置
    voxel = zeros(1,2);
    visitied_voxels = [];
    grid_size = 1;
    last_voxel = floor(ray_end);

%   axis X
    dx = ray_end(1)-ray_start(1);
    stepX = sign(dx);
    if(stepX ~= 0)
        tDeltaX = min(stepX * grid_size/dx,1000000.0);
    else
        tDeltaX = 100000.0;
    end
    if(stepX > 0)
        tMaxX = tDeltaX * FRAC1(ray_start(1),grid_size);
    else
        tMaxX = tDeltaX * FRAC0(ray_start(1),grid_size);
    end
    voxel(1) = floor(ray_start(1));

%   axis Y
    dy = ray_end(2)-ray_start(2);
    stepY = sign(dy);
    if(stepY ~= 0)
        tDeltaY = min(stepY * grid_size/dy,1000000.0);
    else
        tDeltaY = 100000.0;
    end
    if(stepY >= 0)
        tMaxY = tDeltaY * FRAC1(ray_start(2),grid_size);
    else
        tMaxY = tDeltaY * FRAC0(ray_start(2),grid_size);
    end
    voxel(2) = floor(ray_start(2));

% %   axis Z
%     dz = ray_end(3)-ray_start(3);
%     stepZ = sign(dz);
%     if(dz ~= 0)
%         tDeltaZ = min(dz/ray_end(3)-ray_start(3),1000000.0);
%     else
%         tDeltaZ = 100000.0;
%     end
%     tMaxZ = tDeltaZ * FRAC(ray_start(3),grid_size);
%     voxel(3) = floor(ray_start(3));

    if(stepX == 0 && stepY == 0)
        return;
    end
    visitied_voxels = [visitied_voxels,voxel];

%   光线投射遍历
    while(true)
%       先跳x轴还是y轴
        if(tMaxX < tMaxY)
            voxel(1) = voxel(1) + stepX;
            tMaxX = tMaxX + tDeltaX;
        else
            voxel(2) = voxel(2) + stepY;
            tMaxY = tMaxY + tDeltaY;
        end
%       添加体素进列表
        visitied_voxels = [visitied_voxels;voxel];
        if(voxel(1) == last_voxel(1) && voxel(2) == last_voxel(2) )
            break;
        end
%       如果光线到达了终点，就终止  
        if(tMaxX > 1 && tMaxY > 1) 
            break;
        end

    end

end


