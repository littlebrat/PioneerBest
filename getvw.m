function [v,w]=getvw(teta,desvioang,desviox,desvioy,k1,k2,k3)
   v=(desvioy-k2)/sin(teta);
   w=-k3;


return