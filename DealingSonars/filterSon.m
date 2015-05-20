function result = filterSon(allreading)
    for i=1:4
        median=sort(allreading(:,i));
        result(i)=median(2);
    end
end