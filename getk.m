function [k1, k2, k3]=getk(desviox,desvioy,desvioang,v,w,teta)
  
   
    k1=(desviox-cos(teta)*v);
    k2=(desvioy-sin(teta)*v);
    k3=(desvioang-w);
    
    return 
    
    
    

