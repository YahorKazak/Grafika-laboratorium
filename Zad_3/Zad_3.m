function [x,y,z] = Zad_3()
  index = 0;
  for x1=1:10
   for y1=1:10
     for z1=1:10
        index = index + 1;
        x(index)=x1;
        y(index)=y1;
        z(index)=z1;
      endfor
    endfor
   endfor
   scatter3(x,y,z);
endfunction
