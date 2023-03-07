function map = generate2DMap(rows,cols,obsRate,startPos,goalPos)
% 0-空闲区域，1-障碍物，2-起始点，3-目标点

    %设置地图
    map = zeros(rows,cols); 


    %设置障碍物
    obsNum = floor(rows*cols*obsRate);
    obsIndex = randi([1,rows*cols],obsNum,1);
    [r,c] = size(obsIndex);
    for i = 1:r
        map(floor(obsIndex(i)/rows)+1,mod(obsIndex(i),rows)+1) = 1;
    end


    % 设置起始点和终点
    map(startPos(1),startPos(2)) = 2;
    map(goalPos(1),goalPos(2)) = 3;


end

