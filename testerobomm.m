my_timer=timer('ExecutionMode','fixedRate','Period',0.1,'TimerFcn', 'flag=my_callback_fcn');
%my_timercalibration=timer('ExecutionMode','fixedRate','Period',7,'TimerFcn', 'flagcalib=my_callback_fcncalib');
flag=0;
%flagcalib=0;
counttimer=0;
%Trajectoria de refer�ncia
x_ref=[];
y_ref=[];
teta_ref=[];
v_ref=[];
w_ref=[];
figure
k=1;
hold on;

%In�cio: robot est� na sala
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

%Linha recta at� � porta

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
%robot est� na porta
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

% Seguir a traject�ria de refer�ncia
SP = serial_port_start();
pioneer_init(SP);
start(my_timer);
%start(my_timercalibration);
% Seguir a traject�ria de refer�ncia


% K's da lei de Controlo
wn=0.2;
csi=0.9;

K1=2*wn*csi;
K3=2*wn*csi;
V=[];
a=12; %15
b=10;
c=30; %20
k=1;
i=0;
count_y=0;
count_x=0;
xcount=[];
ycount=[];
while k<length(x_ref)-1
   
    K2=(wn^2-(w_ref(k))^2)/abs(v_ref(k));
    
    ODOM=pioneer_read_odometry();
    teta(k)=ODOM(3)*(2*pi)/4096;
    if(k~=1 && teta_ref(k)==pi) 
        y(k)=ODOM(2)-3670+a*sin(teta(k))+count_y;
        x(k)=ODOM(1)-2350+a*cos(teta(k))+count_x;
    else
        if(k~=1 && teta_ref(k)==-pi/2)
             y(k)=ODOM(2)-3670+c*sin(teta(k))+count_y;
             x(k)=ODOM(1)-2350+c*cos(teta(k))+count_x;
        else
          if(k~=1)
          y(k)=ODOM(2)-3670+b*sin(teta(k))+count_y;
          x(k)=ODOM(1)-2350+b*cos(teta(k))+count_x;
          else
            y(k)=ODOM(2)-3670;
            x(k)=ODOM(1)-2350;
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
             count_x=count_x+cos(teta(k))*a;
             count_y=count_y+sin(teta(k))*a;
            
        else
            if(rem(k,100)==0 && teta_ref(k)==-pi/2) 
             count_x=count_x+cos(teta(k))*c;
             count_y=count_y+sin(teta(k))*c;
            
              else
                if(rem(k,100)==0)
                 count_x=count_x+cos(teta(k))*b;
                 count_y=count_y+sin(teta(k))*b;
                end
            end
         end
       xcount=[xcount count_x];
       ycount=[ycount count_y];
        
        if(teta_ref(k)==pi/2 && x_ref(k)>14*1000)
             w=w+4;
        else
            if(teta_ref(k)==pi)
            w=w+3;
                else
                    if(teta_ref(k)==-pi/2)
                    w=w+3;
                    else
                         w=w+1;
                    end
            end
        end 
        pioneer_set_controls(SP, v, w);
        k=k+1;
        flag=0;
    end
end


