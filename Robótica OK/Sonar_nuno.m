%% Setup
clear all
my_timer=timer('ExecutionMode','fixedRate','Period',0.5,'TimerFcn','flag=my_callback_fcn');
SP = serial_port_start();
pioneer_init(SP);
w=36;
flag=0;
pioneer_set_controls(SP, 50, 0);
start(my_timer);
%% Plot Settings
figure(1)
hold on
axis([0  15000 -3500 3500])

%% Robot pose
mypoint1=[0 0];moving1=plot(mypoint1(1),mypoint1(2),'r*');
redzone=makecircle(500,mypoint1);movingred=plot(redzone(:,1),redzone(:,2),'r');
yellowzone=makecircle(800,mypoint1);movingyellow=plot(yellowzone(:,1),yellowzone(:,2),'y');

%% Map Construction with Sonar
sonarmap=[];
before=pioneer_read_sonars();
pause(0.5);
present=pioneer_read_sonars();
pause(0.5);

while(1)
    if flag==1
        %% Ler odometria
        ODOM=pioneer_read_odometry();
        x=ODOM(1);
        y=ODOM(2);
        tet=2*pi*ODOM(3)/4096;
        
        %% Ler Sonares e filtragem
        SONAR=pioneer_read_sonars();
        filtered=medfilt1([before present SONAR],3);
        corrson(1)=filtered(1);
        corrson(2)=filtered(4);
        corrson(3)=filtered(5);
        corrson(4)=filtered(8);

        P = [71 133+corrson(1);165+corrson(2) 26; 165+corrson(3) -26; 71 -133-corrson(4)];

        for i=1:4
           P(i,1)= x + P(i,1)*cos(tet)+P(i,2)*sin(tet);
           P(i,2)= y - P(i,1)*sin(tet)+P(i,2)*cos(tet);
        end
        
        for i=1:4
             if abs(P(i,1)-x)<2000 && abs(P(i,2)-y)<3000
                 plot(P(i,1),P(i,2),'*');
                 drawnow
                 sonarmap=[sonarmap; P(i,:)];
             end
        end
       
        flag=0;
        
        before=present;
        present=SONAR;
        
        %% Desenho da pose do robot
        delete(moving1);
        delete(movingred);
        delete(movingyellow);
        mypoint1=[x y];moving1=plot(mypoint1(1),mypoint1(2),'r*');
        redzone=makecircle(500,mypoint1);movingred=plot(redzone(:,1),redzone(:,2),'r');
        yellowzone=makecircle(800,mypoint1);movingyellow=plot(yellowzone(:,1),yellowzone(:,2),'y');
       
    end
    
end