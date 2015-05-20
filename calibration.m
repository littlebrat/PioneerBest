SP = serial_port_start();
pioneer_init(SP);

v=0;
w=0;
pioneer_set_controls(SP, v, w);
SONAR=pioneer_read_sonars();
pause(12);
ODOM=pioneer_read_odometry();

pioneer_set_controls(SP, v, 0);
pause(100);
pioneer_set_controls(SP,0,0);