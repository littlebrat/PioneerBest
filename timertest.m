my_timer=timer('ExecutionMode','fixedRate','Period',0.1,'TimerFcn', 'flag=my_callback_fcn');
my_timercalibration=timer('ExecutionMode','fixedRate','Period',7,'TimerFcn', 'flag=my_callback_fcncali');
SP = serial_port_start();
pioneer_init(SP);
w=0;
v=99;
flag=0;
rotacao=0;
flagcalib=0;
start(my_timer);
start(my_timercalibration);
while(1)
    ODOM=pioneer_read_odometry()
    if(ODOM(1)>1800)
        v=99;
        w=round((v/(1.20*1000))*180/pi);
        rotacao=1;
    end
    if(ODOM(2)>1000)
        v=99;
        w=0;
        rotacao=0;
    end
    
     if rotacao==1 && flagcalib==1
            w=w-3;
     end
    if flag==1
        pioneer_set_controls(SP, v, w);
        flag=0;
    end


end









%stop(my_timer)