function [] = Zad_2(macierz1,operator,macierz2)
  wynik = 0;
  summa = 0;
  
   if operator == 'dW'
      for i=1:length(macierz1)
        summa +=(macierz1(i)*macierz1(i))
       endfor
       wynik = sqrt(summa);
       display(wynik);
       return;
     endif
  
  
  if length(macierz1) != length(macierz2)
    display('bled dlugosci');
  else  
  
    if operator == '*w'
      if length(macierz1) < 3
        display('dlugosc minimum 3')
      else
        wynik = cross(macierz1,macierz2);
        display(wynik);
        return;
      endif
    endif
    
    if operator == '*s'
      wynik = dot(macierz1,macierz2);
      display(wynik);
      return;
     endif
    
    if operator == '+'
      wynik =(macierz1 + macierz2);
      display(wynik);
      return;
     endif
   
    if operator == '-'
      wynik = (macierz1 - macierz2);
      display(wynik);
      return;
     endif
  endif
   
endfunction
