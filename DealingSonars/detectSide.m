function result = detectSide(map,odom,thrpoints)
    x=odom(1);
    y=odom(2);
    pointsdetected=0;
    mydistance=0;
    result=10000;
    for i=1:size(map,1)
       if abs(map(i,1)-x)<1200 && abs(map(i,2)-y)<1200
           mydistance=mydistance+map(i,1); 
           pointsdetected=pointsdetected+1;
       end
    end
    
    if pointsdetected>thrpoints
        result=mydistance/pointsdetected;
    end
end