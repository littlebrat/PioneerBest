my_timer=timer('ExecutionMode','fixedRate','Period',0.1,'TimerFcn', 'flag=my_callback_fcn');
%my_timersonars=timer('ExecutionMode','fixedRate','Period',0.5,'TimerFcn', 'flagcalib=my_callback_fcncalib');
flag=0;
%flagcalib=0;
counttimer=0;
%Trajectoria de referência
x_ref=[];
y_ref=[];
teta_ref=[];
v_ref=[];
w_ref=[];
figure
k=1;
hold on;

%Início: robot está na sala
y_ref(k)=-3670;
x_ref(k)=-2350;
teta_ref(k)=0;

%plot(x_ref(k),y_ref(k),'*');

while x_ref(k)<-0.55*1000
    
       v_ref(k)=0.1;
       w_ref(k)=0;
       
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end


%Curva dentro da sala

y_ref(k)=-3.67*1000;
x_ref(k)=-0.55*1000;
teta_ref(k)=0;

%plot(x_ref(k),y_ref(k),'*');
while y_ref(k)<-2.51*1000
    
       v_ref(k)=0.1;
       w_ref(k)=v_ref(k)/1.16;
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end

%Linha recta até à porta

y_ref(k)=-2.51*1000;
x_ref(k)=0.61*1000;
teta_ref(k)=pi/2-atan2(0.21,2.51);

%plot(x_ref(k),y_ref(k),'*');
while y_ref(k)<0
    
       v_ref(k)=0.1;
       w_ref(k)=0;
       
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end
%robot está na porta
y_ref(k)=0;
x_ref(k)=0.83*1000;
teta_ref(k)=pi/2;

%plot(x_ref(k),y_ref(k),'*');
while x_ref(k)<1.67*1000
    
       v_ref(k)=0.1;
       w_ref(k)=-v_ref(k)/0.83;
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end

%robot v_refai andar em linha recta no corredor dos elev_refadores
y_ref(k)=0.835*1000;
x_ref(k)=1.67*1000;
teta_ref(k)=0;
while x_ref(k)<14.06*1000
    
       v_ref(k)=0.1;
       w_ref(k)=0;
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end

%robot v_refai passar o canto entre o corredor dos elev_refadores e o das casas de
%banho
y_ref(k)=0.835*1000;
x_ref(k)=14.06*1000;
teta_ref(k)=0;
while y_ref(k)<1.67*1000
    
       v_ref(k)=0.1;
       w_ref(k)=v_ref(k)/0.83;
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       hold on;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end

%robot v_refai entrar no corredor das casas de banho
y_ref(k)=1.67*1000;
x_ref(k)=14.90*1000;
teta_ref(k)=pi/2;

while y_ref(k)<14.06*1000
    
       v_ref(k)=0.1;
       w_ref(k)=0;
       
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       hold on;
       k=k+1;
      % plot(x_ref(k),y_ref(k),'*');
end

%robot v_refai passar o canto entre o corredor das casas de banho e o da sala
%de controlo

y_ref(k)=14.06*1000;
x_ref(k)=14.90*1000;
teta_ref(k)=pi/2;
while x_ref(k)>14.06*1000
    
       v_ref(k)=0.1;
       w_ref(k)=v_ref(k)/0.83;
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       hold on;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end

%robot v_refai passar pelo corredor da sala de controlo

y_ref(k)=14.90*1000;
x_ref(k)=14.06*1000;
teta_ref(k)=pi;

while x_ref(k)>1.67*1000
    
       v_ref(k)=0.1;
       w_ref(k)=0;
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       hold on;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end

%robot v_refai passar o canto entre o corredor da sala de controlo e o corredor
%de regresso

y_ref(k)=14.90*1000;
x_ref(k)=1.67*1000;
teta_ref(k)=pi;
while y_ref(k)>14.06*1000
    
       v_ref(k)=0.1;
       w_ref(k)=v_ref(k)/0.83;
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       hold on;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end

%robot vai passar pelo corredor de regresso

y_ref(k)=14.06*1000;
x_ref(k)=0.83*1000;
teta_ref(k)=-pi/2;

while y_ref(k)>0
    
       v_ref(k)=0.1;
       w_ref(k)=0;
       
       x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
       y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
       teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
       hold on;
       k=k+1;
       %plot(x_ref(k),y_ref(k),'*');
end

% Seguir a trajectória de referência
SP = serial_port_start();
pioneer_init(SP);
start(my_timer);
%start(my_timercalibration);
% Seguir a trajectória de referência


% K's da lei de Controlo
wn=0.2;
csi=0.9;


before=0;
present=0;
K1=2*wn*csi;
K3=2*wn*csi;
V=[];
a=20; %20
b=10;
c=13;
aa=10; %10
bb=8; %8
cc=20; %20
ctetrans=75;
k=1;    
i=0;
count_y=0;
count_x=0;
xcount=[];
ycount=[];
count_x_transv=0;
count_y_transv=0;
while k<length(x_ref)-1
   
    
    K2=(wn^2-(w_ref(k))^2)/abs(v_ref(k));
        
    ODOM=pioneer_read_odometry();
    teta(k)=ODOM(3)*(2*pi)/4096;
    if(k~=1 && teta_ref(k)==pi) 
        y(k)=ODOM(2)-3670+a*sin(teta(k))+count_y-aa*cos(teta(k));
        x(k)=ODOM(1)-2350+a*cos(teta(k))+count_x+aa*sin(teta(k));   
                
    elseif(k~=1 && teta_ref(k)==pi/2)
        x(k)=ODOM(1)-2350+c*cos(teta(k))+count_x+cc*sin(teta(k));
        y(k)=ODOM(2)-3670+c*sin(teta(k))+count_y-cc*cos(teta(k));
        
    elseif(k~=1)
        y(k)=ODOM(2)-3670+b*sin(teta(k))+count_y-bb*cos(teta(k));
        x(k)=ODOM(1)-2350+b*cos(teta(k))+count_x+bb*sin(teta(k));
                
    else
        y(k)=ODOM(2)-3670;
        x(k)=ODOM(1)-2350;
          
    end
    
    T=40; %thresholdpontos
    
    if(rem(k,500)==0)
        map=buildmap([x(k) y(k) teta(k)], map, SONARS);
        dist=detectfrontwall(map, [x(k) y(k) teta(k)], T);
        if(dist<2000 && x(k)>0 && y(k)>0)
            if(teta_ref(k)==0)
               
                count_x=count_x+15730-dist-x(k);
                x(k)=15730-dist;

            elseif(teta_ref(k)==pi/2)
                
                count_y=count_y+15730-dist-y(k);
                y(k)=15730-dist;
                
            elseif(teta_ref(k)==pi)
                
                count_x=count_x+dist-x(k);
                x(k)=dist;
                
            end
        end
    end
    
    we_teta=teta_ref(k)-teta(k);
    we_teta=wrapToPi(we_teta);
    we_x=(x_ref(k)-x(k))/1000;
    we_y=(y_ref(k)-y(k))/1000;
    be_teta=we_teta;
    be_x=cos(teta(k))*we_x+sin(teta(k))*we_y;
    be_y=cos(teta(k))*we_y-sin(teta(k))*we_x;
    
    u1=-K1*be_x;
    u2=-K2*sign(v_ref(k))*be_y-K3*be_teta;
    
    v=(cos(be_teta)*v_ref(k)-u1)*1000;
    w=w_ref(k)-u2;
    V=[V v];
    w=floor(w*180/pi);
    v=round(v);
    if flag==1
        if(rem(k,100)==0 && teta_ref(k)==pi) 
             count_x=count_x+cos(teta(k))*a+sin(teta(k))*aa;
             count_y=count_y+sin(teta(k))*a-cos(teta(k))*aa;
            
        elseif(rem(k,100)==0 && teta_ref(k)==pi/2) 
             count_x=count_x+cos(teta(k))*c+sin(teta(k))*cc;
             count_y=count_y+sin(teta(k))*c-cos(teta(k))*cc;
             
        elseif(rem(k,100)==0)
             count_x=count_x+cos(teta(k))*b+sin(teta(k))*b;
             count_y=count_y+sin(teta(k))*b-cos(teta(k))*b;
        end
         
      
       xcount=[xcount count_x];
       ycount=[ycount count_y];
        
        pioneer_set_controls(SP, v, w);
        k=k+1;
        flag=0;
    end
end

