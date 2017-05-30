%leer la matriz del espacio de color
x = input('ingrese la matriz del espacio de color: ');
%Leer la ruta de la imagen a la q se le aplica el espacio de color
y = imread(input('Ingrese la ruta de la imagen, RECUERDE usar comillas: '));
%matrices de los 3 colores
y1=y(:,:,1);
y2=y(:,:,2);
y3=y(:,:,3);
%__________________________________________________________________________________%
%Implementacion de gauss-jordan
%tamaño de x
[alfa,beta] = size(x);
%tamaños de y
[n,m] = size(y);
%vector de colores viejos
b = zeros(1,alfa);
%matriz de colores nuevos
nuevo = zeros(n,m);
%error
err = 0;
%operacion para alla er equivalente:
for i=1:n
    for j=1:m
        %asignar todas las posiciones de los 3 matrices
        b(1,1) = y1(i,j);
        b(1,2) = y2(i,j);
        b(1,3) = y3(i,j);
        %asignar buscar equivalente en el nuevo espacio de color
        %profe se me olvido mostrar aca me sale un error
        [nuevo(i,j),err] = gauss_jordan_Melisa_Morales(x,b);                
    end
end
%Matriz nueva de color RGB
imshow(nuevo);