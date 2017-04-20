clear,clc
%valor a interpolar
x = input('Ingrese el valor de xi que se desea encontrar: ');
%Valores 
%p0 = (x0,y0)
% p0 = [80,0.9848];
% p1 = [90,1];
% p2 = [100,0.9848];
% p0 = [3,54];
% p1 = [4,128];
% p2 = [6,432];

% % para encontrar cos(85)
% p0 = [80,0.173648];
% p1 = [90,0];
% p2 = [100,-0.173648];

%para encontrar 2.5=0
p0 = [1,1];
p1 = [2,-1];
p2 = [3,1];
p3 = [4,-1];

%nuevos vectores de numeros
xf = [p0(1),p1(1),p2(1),p3(1)];
yf = [p0(2),p1(2),p2(2),p3(2)];

%___________________________polinomio de lagrange__________________________________%
%valores para almacenar los datos del polinimio
e = 0;
val = 0;
%ciclo para recorrer el vector de puntos
for i=1:length(xf)
    %variable para almacenar el valor de la Yi 
    %asociada a la posicion en la que estamos
    e = yf(i);
    %Ciclo para encontrar el valor de los puntos
    %depende del grado que se tenga
    for k=1:length(xf)
        %si es diferente i de k se debe de hacer 
        %produtorio
        if i ~= k     
           %el valor que se tenia antes, se multiplica 
           %por el valor obtenido en el nuevo punto.
           e = e*(x-xf(k))/(xf(i)-xf(k));
        end
    end
    %el valor encontrado al reemplazar en la funcion
    %se suma con los valores anteriores.
    val = val + e;
end
disp(val);



