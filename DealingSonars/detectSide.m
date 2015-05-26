function result = detectSide(map,odom,thrpoints)
    x=odom(1);
    y=odom(2);
    tet=odom(3);
    pointsdetected=0;
    mydistance=0;
    result=10000;
    
    for i=1:size(map,1)
       if tet>-0.1745 && tet<0.1745 && abs(x-map(i,1))<1000 && y-map(i,2)<2000 && y-map(i,2)>0
           mydistance=mydistance+y-map(i,2); 
           pointsdetected=pointsdetected+1;
       elseif tet>1.3963 && tet<1.7453 && abs(y-map(i,2))<1000 && map(i,1)-x<2000 && map(i,1)-x>0
           mydistance=mydistance+map(i,1)-x; 
           pointsdetected=pointsdetected+1;
       elseif tet>2.9671 && tet<3.3161 && abs(x-map(i,1))<1000 && map(i,2)-y<2000 && map(i,2)-y>0
           mydistance=mydistance+map(i,2)-y; 
           pointsdetected=pointsdetected+1;    
       elseif tet>4.5379 && tet<4.8869 && abs(y-map(i,2))<1000 && x-map(i,1)<1000 && x-map(i,1)>0
           mydistance=mydistance+x-map(i,1); 
           pointsdetected=pointsdetected+1;    
       end
    end
    
    if pointsdetected>thrpoints
        result=mydistance/pointsdetected;
    end
end