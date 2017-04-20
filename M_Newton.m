clear,clc

%Grado del polinomio
n = input('Ingrese el grado del polinomio: ');
%valor a interpolar
x = input('Ingrese el valor de xi que se desea encontrar: ');
%Valores 
%p0 = (x0,y0)
%% para encontrar sen(85)
% p0 = [80,0.9848];
% p2 = [100,0.9848];
% p1 = [90,1];

%% para encontrar cos(85)
% p0 = [80,0.173648];
% p1 = [90,0];
% p2 = [100,-0.173648];


%%para encontrar 4
% p0 = [2,4];
% p1 = [3,6];
% p2 = [5,10];

 
 %% para encontrar 5=125 o 7=343
% p0 = [3,27];
% p1 = [4,64];
% p2 = [6,216];
% p1 = ;[5,125]
% p2 = [8,512];

%para encontrar 2.5=0
p0 = [1,1];
p1 = [2,-1];
p2 = [3,1];
p3 = [4,-1];
% 
% n = 3;

%nuevos vectores de numeros
xf = [p0(1),p1(1),p2(1),p3(1)];
yf = [p0(2),p1(2),p2(2),p3(2)];

%____________________Polinomio de newton__________________________________%
%Restas de los vectores y valores
%Vector de valores de a1
p = n+1;

v_a = yf;
v_t = zeros(1,p);
v_as = zeros(1,p);
v_as(1)=yf(1);
R_x = 0;
R_y = 0;
j = 1;

while j<=p
    k = j+1;
    i = 1;
    while (i<=n && k<=n+1)
        R_x = xf(k)-xf(i);
        R_y =  v_a(i+1)-v_a(i);
        v_t(i) = R_y/R_x;
        k = k+1;
        i = i+1;
               
    end
    v_a = v_t;
    v_as(j+1) = v_a(1); 
    %disp(v_a);
    
    %disp(v_t);
    v_t = zeros(1,p);
    j=j+1;
    
end
disp(v_as);
ban = 1;
pol = 0;
for i=1:n+1
    if i == 1 
        pol = v_as(1);
    else
        ban = ban*(x-xf(i-1));
        pol = pol + v_as(i)*ban;
        
    end
    
end
disp(pol);
