function [] = zad1(R,G,B)
  %CMYK
   RGB = [R;G;B];
   R1 = R/255;
   G1 = G/255;
   B1 = B/255;
   K = 1- max([R1,G1,B1]);
   C = ((1-R1-K)/(1-K))*100;
   M = ((1-G1-K)/(1-K))*100;
   Y = ((1-B1-K)/(1-K))*100;
   K = K*100;
   CMYK = [C,M,Y,K];
   display(CMYK);
   %XYZ
   RGB2XYZ=[0.49000 0.31000 0.20000
   0.17697 0.81240 0.01063
   0.00000 0.01000 0.99000];
 
   CIEXYZ = RGB2XYZ * RGB;
   display(CIEXYZ);
   %LAB
   X0 = 94.81;
   Y0 = 100.0;
   Z0 = 107.3;
   
   %L
   L1 = CIEXYZ(2)/Y0;
   if L1 > 0.008856
    fy = L1^(1/3);
   else
     fy = (903.3*L1+16)/116;
   endif
   L = 116*fy -16;
   
   %a
   a1 = CIEXYZ(1)/X0;
   if a1 > 0.008856
    fx = a1^(1/3);
   else
     fx = (903.3*a1+16)/116;
   endif
   a = 500*(fx - fy);
   
   %b
   b1 = CIEXYZ(3)/Z0;
    if b1 > 0.008856
    fz = b1^(1/3);
   else
     fz = (903.3*b1+16)/116;
   endif
   b = 200*(fy - fz);
   Lab = [L,a,b];
   display(Lab);
   %CIELUV
   u0=0.2009;
   v0 = 0.4610;
   u1 = (4*CIEXYZ(1))/(CIEXYZ(1)+15*CIEXYZ(2)+3*CIEXYZ(3));
   v1 = (9*CIEXYZ(1))/(CIEXYZ(1)+15*CIEXYZ(2)+3*CIEXYZ(3));
   if L1 > (6/29)^3
     Lc=116*(L1)^(1/3)-16;
    else
     Lc = (29/3)^3 *L1;
    endif
    
    u = 13*Lc*(u1-u0);
    v = 13*Lc*(v1-v0);
    
    LUV=[Lc,u,v];
    display(LUV);
    
    %HSV
    RGBmax = max(RGB);
    RGBmin = min(RGB);
    
    
    if RGBmax == RGBmin
      H=0;
    endif
    
     if RGBmax == R && G >= B
       H=60*((G-B)/(RGBmax-RGBmin))+ 0;
     endif
    
     if RGBmax == R && G < B
       H=60*((G-B)/(RGBmax-RGBmin))+ 360;
     endif
    
     if RGBmax == G
       H=60*((B-R)/(RGBmax-RGBmin))+ 120;
     endif
    
     if RGBmax == B
       H=60*((R-G)/(RGBmax-RGBmin))+ 240;
     endif
    
    if RGBmax == 0
      S = 0;
    else
      S=1-(RGBmin/RGBmax);
    endif
    
    V = RGBmax;
    
    HSV = [H,S,V];
    display(HSV);
    
   %HSL
    Cmax = max([R1,G1,B1]);
    Cmin =min([R1,G1,B1]);
    delta = Cmax - Cmin;
    if delta == 0
      H1 = 0;
     endif
     
      if Cmax == R1
       H1 = 60*mod((G1-B1)/delta,6);
       
       endif
      
       if Cmax == G1
         H1 = 60*((B1-R1)/delta + 2);
       
        endif
      
       if Cmax == B1
         H1 = 60*((R1-G1)/delta + 4);       
        endif
        
        L_h =(Cmax + Cmin)/2;
        
        if delta == 0
          S1 = 0
        else
          S1 = delta/(1-abs(2*L_h-1));
         endif 
         
         HSL = [H1,S1,L_h];
         display(HSL);
      
     %YUV
     Kr = 0.2627;
     Kb = 0.0593;
     Y1 = Kr*R+(1-Kr-Kb)*G+Kb*B;
     U1 = B-Y1;
     V1 = R - Y1;
     YUV = [Y1,U1,V1];
     display(YUV);
     
     %YIQ
     Y_ = 0.299 * R + 0.587 * G + 0.114 * B;
     I = 0.596 * R - 0.274 * G - 0.322 * B;
     Q = 0.211 * R - 0.522 * G + 0.311 * B;
     YIQ =[Y_,I,Q];
     display(YIQ);
      
endfunction
