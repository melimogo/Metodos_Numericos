%leer los vectores 
% x = input('Ingrese el vector de  de x: ');
% y = input('Ingrese el vector de y: ');
% %leer grado del polinomio
% n = input('Ingrese el grado del polinomio: ');

n = 2;
x = [2,3,4,5,6,7];
y = [13;20;25;36;45;60];

%largo de la matriz
s = length(x);
%matriz F'
j = 2;
a = ones(1,s);
f = [a;x]; 

while j<=n
    f = [f ; x.^j];
    j=j+1;
end

A = mtimes(f,f');
disp('Valores de S: ');
disp(A);
bb = mtimes(f,y);
A = [A,bb];
disp('Valores de b: ');
disp(bb);
final = gaussJordanm(A);
disp('El valor para c1,c2,c3: ');
disp(final(:,length(final)));



