function result = detectFrontWall(map,odom,thrpoints)
    x=odom(1);
    y=odom(2);
    pointsdetected=0;
    mydistance=0;
    for i=0:size(map,1)
        if map(i,1)-x<5000  && abs(map(i,2)-x)< 400 && map(i,1)>0
            mydistance=mydistance+map(i,1);%nao tenho a certeza se � x ou y
        end
    end
    if pointsdetected>thrpoints
        result=mydistance/pointsdetected;
    else
        result=10000;
    end
    
end