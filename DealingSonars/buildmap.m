function result = buildmap(map,odom,sonar,thr)
    mypoints = [71 133+sonar(1);165+sonar(2) 26; 165+sonar(3) -26; 71 -133-sonar(4)];
    x=odom(1);
    y=odom(2);
    tet=odom(3);
     
    for i=1:4
       mypoints(i,1)= x + mypoints(i,1)*cos(tet)+mypoints(i,2)*sin(tet);
       mypoints(i,2)= y - mypoints(i,1)*sin(tet)+mypoints(i,2)*cos(tet);
       if abs(mypoints(i,1)-x)<thr && abs(mypoints(i,2)-y)<thr
         map=[map; mypoints(i,:)];
       end
    end
    result=map;
end