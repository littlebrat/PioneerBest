my_timer=timer('ExecutionMode','fixedRate','Period',0.1,'TimerFcn', 'flag=my_callback_fcn');
my_timercalibration=timer('ExecutionMode','fixedRate','Period',7,'TimerFcn', 'flag=my_callback_fcncalib');
flag=0;
rotacao=0;
flagcalib=0;
%Trajectoria de referência
x_ref=[];
y_ref=[];
teta_ref=[];
v_ref=[];
w_ref=[];
k=1;
hold on;

%Início: robot está na sala
y_ref(k)=-3670;
x_ref(k)=-2350;
teta_ref(k)=0;


while x_ref(k)<-550
    
       v_ref(k)=0.1;
       w_ref(k)=0;
        x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
           y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
           teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
           k=k+1;
       
end


%Curva dentro da sala

y_ref(k)=-3670;
x_ref(k)=-550;
teta_ref(k)=0;

while y_ref(k)<-2510
  
       v_ref(k)=0.1;
       w_ref(k)=v_ref(k)/1.16;
       
        x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
           y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
           teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
           k=k+1;
       
end
    
%Linha recta até à porta

y_ref(k)=-2510;
x_ref(k)=610;
teta_ref(k)=pi/2-atan2(0.21,2.51);

plot(x_ref(k),y_ref(k),'*');
while y_ref(k)<0
    
       v_ref(k)=0.1;
       w_ref(k)=0;
           x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
           y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
           teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
           k=k+1;
end

%robot está na porta
y_ref(k)=0;
x_ref(k)=830;
teta_ref(k)=pi/2;

plot(x_ref(k),y_ref(k),'*');
while x_ref(k)<1670
   
       v_ref(k)=0.1;
       w_ref(k)=-v_ref(k)/0.83;
      
         x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
           y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
           teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
           k=k+1;
end
   
%robot v_refai andar em linha recta no corredor dos elev_refadores
y_ref(k)=835;
x_ref(k)=1.67*1000;
teta_ref(k)=0;
while x_ref(k)<14.06*1000
    
       v_ref(k)=0.1;
       w_ref(k)=0;
         x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
           y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
           teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
           k=k+1;
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
           k=k+1;
       
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
           k=k+1;
       
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
           k=k+1;
      
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
           k=k+1;
           
     
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
           k=k+1;
           
end

%robot vai passar pelo corredor de regresso

y_ref(k)=14.06*1000;
x_ref(k)=0.83*1000;
teta_ref(k)=-pi/2;

while y_ref(k)>0
    
       v_ref(k)=0.1;
       w_ref(k)=0;
       
     % if(flagref==1)
            x_ref(k+1)=x_ref(k)+cos(teta_ref(k))*v_ref(k)*1000*0.1;
           y_ref(k+1)=y_ref(k)+sin(teta_ref(k))*v_ref(k)*1000*0.1;
           teta_ref(k+1)=teta_ref(k)+w_ref(k)*0.1;
           k=k+1;
            %flagref=0;
            

end


SP = serial_port_start();
pioneer_init(SP);
start(my_timer);
start(my_timercalibration);
% Seguir a trajectória de referência

%condição inicial
y=[];
x=[];
teta=[];

% K's da lei de Controlo
wn=0.1;
csi=0.9;

K1=2*wn*csi;
K3=2*wn*csi;

k=1;

while k<length(x_ref)-1
    
    K2=(wn^2-(w_ref(k))^2)/abs(v_ref(k));
    
    
    ODOM=pioneer_read_odometry();
    y(k)=ODOM(2)-3670;
    x(k)=ODOM(1)-2350;
    teta(k)=ODOM(3)*(2*pi)/4096;
    we_teta=teta_ref(k)-teta(k);
    we_teta=wrapToPi(we_teta);
    we_x=x_ref(k)-x(k);
    we_y=y_ref(k)-y(k);
    be_teta=we_teta;
    be_x=cos(teta(k))*we_x+sin(teta(k))*we_y;
    be_y=cos(teta(k))*we_y-sin(teta(k))*we_x;
    
    u1=-K1*be_x;
    u2=-K2*sign(v_ref(k))*be_y-K3*be_teta;
    
    
    v=cos(be_teta)*v_ref(k)-u1;
    w=w_ref(k)-u2;
    w=floor(w*180/pi);
    v=round(v)
    
   
    
       if flagcalib==1
            w=w-3;
            v=0.9*v;
            v=round(v);
            flagcalib=0;
       end
    
    if flag==1
    
        pioneer_set_controls(SP, v, w);
        k=k+1;
        flag=0;
    end
    
 
    
   
end
    
    
    
       