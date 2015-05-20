function result = updateReadings(nowRead,allreadings)
    corr(1)=nowRead(1);
    corr(2)=nowRead(4);
    corr(3)=nowRead(5);
    corr(4)=nowRead(8);
    if size(allreadings,1)<3
        allreadings=[allreadings corr];
    else
        allreadings(3,:)=allreadings(2,:);
        allreadings(2,:)=allreadings(1,:);
        allreadings(1,:)=corr;
        allreadings=[allreadings  medfilt1(allreadings,3)];
    end
    result=allreadings;
end