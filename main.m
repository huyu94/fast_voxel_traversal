close all;
clc,clear;


%% 构建栅格地图场景

rows = 10;
cols = 10;
obsRate = 0.3;
startPos = [1,1];
goalPos = [rows,cols];
field = generate2DMap(rows,cols,obsRate,startPos,goalPos);


%% 光线投射
ray_start = [1,1];
ray_end = [6,3];
min = [0,0];
max = [10,10];
visitied_voxels = traversal_2D(ray_start,ray_end);

%% 画图 


Draw2DMap(field,visitied_voxels);
