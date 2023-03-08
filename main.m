close all;
clc,clear;


%% 构建栅格地图场景

rows = 10;
cols = 10;
obsRate = 0;
startPos = [1,1];
goalPos = [rows,cols];
field = generate2DMap(rows,cols,obsRate,startPos,goalPos);
grid_size = 1;

%% 光线投射
ray_start = [0,0];
ray_end = [9.6,1.1];
boundary = [0,10,0,10];
visitied_voxels = traversal_2D(ray_start,ray_end,boundary);
[r,c] = size(visitied_voxels);

%% 画图 
% Draw2DMap(field,visitied_voxels);
hold on;
visitied_voxels = visitied_voxels + 0.5;
line([ray_start(1),ray_end(1)],[ray_start(2),ray_end(2)],'LineStyle','-');
for i=1:r
%     field(visitied_voxels(i,1)+1,visitied_voxels(i,2)) = 3;
    plot(visitied_voxels(i,1),visitied_voxels(i,2),'Color','r','Marker','o');
end

grid on;
set(gca,"XLim",[boundary(1),boundary(2)]);
set(gca,"YLim",[boundary(3),boundary(2)]);


