close all;
clc,clear;


%% 构建栅格地图场景

rows = 100;
cols = 100;
obsRate = 0.3;
startPos = [1,1];
goalPos = [rows,cols];
field = generate2DMap(rows,cols,obsRate,startPos,goalPos);


%% 光线投射
ray_start = [1.5,1.5];
ray_end = [100,60];
min = [0,0];
max = [100,100];
visitied_voxels = traversal_2D(ray_start,ray_end);

%% 画图 


Draw2DMap(field,visitied_voxels);
