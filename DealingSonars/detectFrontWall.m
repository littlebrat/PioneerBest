function result = detectFrontWall(map,odom,thrpoints,location)
    x=odom(1);
    y=odom(2);
    pointsdetected=0;
    mydistance=0;
    result=10000;
    switch location
        case 1
            for i=1:size(map,1)
                if map(i,1)-x<5000  && abs(map(i,2)-x)< 300 && map(i,1)-x>0
                    mydistance=mydistance+map(i,1);%nao tenho a certeza se � x ou y
                    pointsdetected=pointsdetected+1;
                end
            end
        case 2
             for i=1:size(map,1)
                if map(i,1)-x<5000  && abs(map(i,2)-x)< 300 && map(i,1)-x>0
                    mydistance=mydistance+map(i,1);%nao tenho a certeza se � x ou y
                    pointsdetected=pointsdetected+1;
                end
             end
        case 3
            for i=1:size(map,1)
                if map(i,1)-x<5000  && abs(map(i,2)-x)< 300 && map(i,1)-x>0
                    mydistance=mydistance+map(i,1);%nao tenho a certeza se � x ou y
                    pointsdetected=pointsdetected+1;
                end
            end   
    end
    if pointsdetected>thrpoints
        result=mydistance/pointsdetected;
    end
    
end