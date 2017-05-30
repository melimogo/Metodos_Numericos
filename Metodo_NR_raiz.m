
%Para leer imagen
f = imread('abue.jpg');
%captura de la matriz 1
f_1 = f(:,:,1);
%tamaño de la matriz
[n,c] = size(f_1);
%numero maximo
mx = double(max(max(f_1)));
%numero minimo
mn = double(min(min(f_1)));

%imprime el maximo y e minimo
sprintf('Valor maximo es: %d y Valor minimo es: %d',mx,mn);
%valores iniciales y pendiente de la ecuación
res = mx-mn;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%function p = newton_raphson(
%Metodo de Newton Raphson
%valor inicial 
xi = 0.5;
%valor de xi en la funcion
fxn = (res*xi); 
%valor de Xi+1 // Raiz de la ecuacion
stop = 0;
cont = 1;
amelia = 0;
ofelia = 0;
rosa = 0;
while (abs(fxn) > 0.002 )
  amelia = res*xi;
  fxn = amelia - 1;
  ofelia = xi^2;
  rosa = fxn * ofelia;
  y = xi + rosa;
  xi = y; 
  cont = cont+1;
end
%funcion a evaluar


%aplicacion del valor obtenido por el metodo de newton_raphson

for i = 1:n
  for j = 1:c
    alfa = 255*y;
    beta = (f_1(i,j) - mn);
    f_nueva(i,j) = alfa*beta;
  end
end

imshow(f_nueva);