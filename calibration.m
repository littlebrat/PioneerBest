SP = serial_port_start();
pioneer_init(SP);
pause(3);
v=100;

pioneer_set_controls(SP, v, 0);
pause(100);
pioneer_set_controls(SP,0,0);