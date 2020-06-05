function [] = Zad_5()
  wynik = zeros(110,110);
  p = zeros(110,110,10);
  for m=1:10
   x = round(randi([5,50]));
   y = round(randi([5,50]));
   x0= round(randi([10,50]));
   y0 = round(randi([10,50]));
   z0 = round(randi([1,10]));
   p(x:x+x0,y:y+y0,z0)=m; 
   
  endfor
  

  
for z=10:-1:1
    for y=1:110
        for x=1:110
        	if p(x,y,z) ~= 0                           
               wynik(x,y) = p(x,y,z);   
                      
        	end
        end
    end    
end
 figure;
 colormap(gray)
 surf(wynik);
 
 figure;
 imshow(wynik);
 
 figure;
 wynik1 = mat2gray(wynik);
 imshow(wynik1);
 
 
 
 

endfunction
