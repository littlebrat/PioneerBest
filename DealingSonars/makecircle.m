function result = makecircle(R,C)
    result=[];
    for i=0:60
        x=R*cos(2*(i/60)*pi)+C(1);
        y=R*sin(2*(i/60)*pi)+C(2);
        result=[result; x y];
    end
end