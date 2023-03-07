function [] = Draw2DMap(map,visitied_voxels)  


%% 构建颜色MAP图
cmap = [1 1 1;  % 1-白色-空地
    0 0 0;      % 2-黑色-静态障碍
    1 0 0;      % 3-红色-动态障碍/遍历voxel
    1 1 0;      % 4-黄色-起始点
    1 0 1;      % 5-品红-目标点
    0 1 0;      % 6-绿色-到目标点的规划路径
    0 1 1];     % 7-青色-动态规划的路径

colormap(cmap);


%% 画栅格图
[rows,cols] = size(map);
c = (visitied_voxels(:,1)-1) * rows + visitied_voxels(:,2);
c = cast(c,'int16');
map(c') = 4;


image(1.5,1.5,map);
grid on;

set(gca,'gridline','-','gridcolor','k','linewidth',2,'GridAlpha',0.5);
set(gca,'XTick',1:cols,'ytick',1:rows);   % 设置坐标
% set(gca,"XAxisLocation",0.5);
set(gca,'YDir','normal');
axis image;      % 沿每个坐标轴使用相同的数据单位，保持一致