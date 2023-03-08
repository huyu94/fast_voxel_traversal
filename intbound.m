function result = intbound(s,ds)
% find the smallest positive t such that s+t*ds is an integer
%INTBOUND 此处显示有关此函数的摘要
%   此处显示详细说明
if(ds < 0)
    result = intbound(-s,-ds);
else
    s = mod(s,1);
    result = (1-s)/ds;
end

