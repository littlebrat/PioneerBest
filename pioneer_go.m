SP = serial_port_start();
pioneer_init(SP);
pause(3);
ODOM=pioneer_read_odometry();
SONAR=pioneer_read_sonars();
%serial_port_stop();

if isempty(SONAR)
        
        break
        
    end