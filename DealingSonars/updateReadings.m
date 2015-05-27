function result = updateReadings(nowRead,allreadings)
    corr(1)=nowRead(1);
    corr(2)=nowRead(4);
    corr(3)=nowRead(5);
    corr(4)=nowRead(8);
    for i=2:5
        allreadings(i,:)=allreadings(i-1,:);
    end
    allreadings(1,:)=corr;
    result=allreadings;
end