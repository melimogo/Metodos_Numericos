%DEclaracion de los vectores
%x = [1 2 5 6 7 8 10];
x=input('El vector del tiempo: ');

%f = [3 5 11 13 15 17 21];
f = input('Ingrese el vector de velocidad: ');

%Vector de ceros que sera el vector de aceleracion
ac = zeros(1,10);

%for para hallar las derivadas de la velocidad
found = 0;
for i = 1:length(x)
    found = 0;
    for  j = 1:10
        if j == x(i)
          %Para buscar los valores que estan en el vector de tiempo
            fprintf('# %0.0f encontrado\n',j);
            if j == 10
              %valor de i cuando llega a 10 
                fprintf('j ya es igual a 10');
                ac(i) = f(i) - f(1);
                found = found + 1;
            else
                %valor para ac cuando se encuentra el numero en el vector de tiempo
                ac(i) = f(i+1) - f(i);
                found = found + 1;
                break;
            end
        end
       
    end
    if found == 0
      %Cuando no se encuentra el numero en el vector del tiempo.
        ac(i) = f(i+1) - f(i-1);
        
     end
    
end
%Mustra el vector aceleracion 
%disp(ac);

a = ac(1:length(x));

%disp(a);
%Grafica el vector aceleracion
if size(ac) != size(x)
  disp('Los vectores tiene tamaños diferentes no se pueden graficar');
  else 
    plot(x,a);
  end