clc
clear
fprintf('Intepolación \n');
fprintf('Polinomio De Lagrange \n\n\n');

image = imread('dani.jpg');

f_r = image(:,:,1);
f_g = image(:,:,2);
f_b = image(:,:,3);




function matrizOrdenada = ordenarMatriz(matriz)
  
  [n,m]= size(matriz);
  matrizOrdenada= matriz;

        for i=1:n
           [minimo, p] = min(abs(matriz(:,1)));
            matrizOrdenada(i,1)= matriz(p,1);
            matrizOrdenada(i,2)= matriz(p,2);
            matriz(p,1)= NaN;
          
          end
          
  end
  

function xy = hallarMinimos(vectorx, vectory, x,grado)
  % minimos es la matriz de n filas x 2 columnas]
  % En la primera columna contiene todas las x
  % En la segunda columna contiene todas la y 
  minimos= [vectorx vectory ];
  
  %La matriz xy es una matriz grado + 1 filas x 2 columnas
  %En esta matriz van a ir las parejas de coordenas ( x, y) cercanas al p(x)
  xy = zeros(grado, 2);
  
  %Hallamos el tamaño de la matriz de minimos
  [n,m] = size(minimos);

  %Relizamos restas 
  % Se realiza restandole el p(x) a cada elemento de la columna
  for i=1:n
    minimos(i, 1) = abs(minimos(i,1) - x);
  end
  
  for i=1:grado
    [minimo, p] = min(abs(minimos(:,1)));
    xy(i,1)= vectorx(p);
    xy(i,2)= vectory(p);
    minimos(p,1)= NaN;
    end
   % xy = ordenarMatriz(xy);    
end

function suma = hallarS(xs)
    %xs = input('Ingrese los números pertenecientes a las x: ');
    ys = [1;2;3;4;5;6;7;8];
    grado = 2;
    px = 100; 
    %n=size(xi,2);
    %n=length(xi);
    n =grado+1;
    A = hallarMinimos(xs, ys,px,n);
    xi =A(:,1);
    yi =A(:,2);
    suma = 0; 
    producto = ones(n,size(xi,2));
    x=px;
    for i=1 :n
        for j=1:n
            if i~=j 
                producto(i,:) = producto(i,:) * (x-xi(j))/(xi(i)-xi(j)); 
                disp('producto')
                disp(producto(i,:))
            end 
        end
                suma = suma + producto(i,:)*yi(i);
              disp('suma') 
               disp(suma)
    end
end

[g,h] = size(f_r);

for i=1:g-1
  for j=1:h-1
    if(f_r(i,j) == 100)
       xs1= (f_r(i,j-8:j));
       xs=xs1';
      
      % f_r(i,j) = hallarS(xs);
       disp(f_r(i,j));
    end  
  end
  
    
  
end
disp(xs)




