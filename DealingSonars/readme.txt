////////////////////////////////////////////////////////////
/////////   Instruções para meter no codigo:   /////////////
////////////////////////////////////////////////////////////

******************************************

%fazer isto no setup
allreadings=zeros(3,4);
map=[];

******************************************

%no ciclo
nowRead=pioneer_read_sonars();
allreading=updateReadings(nowRead,allreadings);
proven_sonar=filterSon(allreading);

%para fazer update ao mapa
map=buildmap(map,***odom_here***,proven_sonar,4000);

%para detectar parede
d=detectFrontWall(map,***odom_here***,***numero_pontos_threshold***);
