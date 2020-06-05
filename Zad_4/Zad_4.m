function [x,y,z] = Zad_4()
  index = 0;
  macierzpunkt = zeros(4,100);
  normalizacja = zeros(4,100);
  i=1; 
  for x1=1:5
   for y1=1:10
     for z1=1:10
        index = index + 1;
        x(index)=x1;
        y(index)=y1;
        z(index)=z1;
      endfor
    endfor
   endfor
   
  for x1=5:10
   for y1=1:5
     for z1=1:10
        index = index + 1;
        x(index)=x1;
        y(index)=y1;
        z(index)=z1;
      endfor
    endfor
   endfor
 for c=1:index
   macierzpunkt(1,i)=x(c);
   macierzpunkt(2,i)=y(c);
   macierzpunkt(3,i)=z(c);
   macierzpunkt(4,i)=1;
   i =i+1;
  endfor;

 d = 0.5;
 perspektywa = [1 0 0 0; 0 1 0 0; 0 0 0 0; 0 0 1/d 1]; 
 newmacierz = perspektywa*macierzpunkt; 
 
 i=1;
 for b=1:index
  normalizacja(1,i)=((newmacierz(1,i)*d)/(macierzpunkt(3,i)+d));
  normalizacja(2,i)=((newmacierz(2,i)*d)/(macierzpunkt(3,i)+d));
  normalizacja(3,i)=0;
  normalizacja(4,i)=1;
  i=i+1;
 endfor




scatter3(normalizacja(1,:),normalizacja(2,:),normalizacja(3,:));

#scatter3(x,y,z);

plik=true(10,10);
ind=sub2ind(size(plik),newmacierz(1,:),newmacierz(2,:));
plik(ind)=0;
figure;
imshow(plik);

 
endfunction
