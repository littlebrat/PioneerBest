function result = buildWall(map,odom,sonar,thr)
    mypoints = [71 -133-sonar(4)];
    x=odom(1);
    y=odom(2);
    tet=odom(3);
    
     xglobal= x + mypoints(1,1)*cos(tet)+mypoints(1,2)*sin(tet);
     yglobal= y - mypoints(1,1)*sin(tet)+mypoints(1,2)*cos(tet);
     if sonar(1)<thr
        map=[map; xglobal yglobal];
     end
     result=map;
end