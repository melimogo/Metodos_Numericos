clear all,close all,clc

% Hacemos la lìnea de la mitad, hallamos
% la columna de la mitad de la matriz y la hacemos
% igual a 256 
function M = valores_ceros(mat)
    [m,n] = size(mat);
    M = zeros(m,n);
    for i=1:m
        for j=1:n
            if j == (n/2) || j == (n/2)-1
                M(i,j)=256;
            else
                M(i,j)= mat(i,j);
            end

        end
    end
end


function y = polinomio_newton(xf,yf,x,n)
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
    y = pol;
end


fprintf('Intepolacion \n');
fprintf('Polinomio De Newton \n\n\n');

image = imread('dani.jpg');
%image = imread('');
% load('color.mat');
% image = color;



f_1 = image(:,:,1);
f_2 = image(:,:,2);
f_3 = image(:,:,3);

f_r = valores_ceros(f_1);
f_g = valores_ceros(f_2);
f_b = valores_ceros(f_3);

%imshow(image);
%imfinfo(image);

[g,h] = size(f_r);

%xf = [p0(1),p1(1),p2(1),p3(1)];
yf = [1;2];
x = 3;
grado = 1;

for i=1:g-1
  for j=1:h-1
    if(f_r(i,j) == 256)

       %rojo
       %;(f_r(i,j+1))
       xs1= [(f_r(i,j-2));(f_r(i,j-1))];
       xs_r=xs1';
       f_r(i,j) = polinomio_newton(yf,xs_r,x,grado);
       %disp(f_r(i,j));

       %verde
       %;(f_g(i,j+1))
       xs2= [(f_g(i,j-2));(f_g(i,j-1))];
       xs_g=xs2';
       f_g(i,j) = polinomio_newton(yf,xs_g,x,grado);
       %disp(f_r(i,j));

       %Azul
       %;(f_b(i,j+1))
       xs3= [(f_b(i,j-2));(f_b(i,j-1))];
       xs_3=xs3';
       f_b(i,j) = polinomio_newton(yf,xs_3,x,grado);
       %disp(f_r(i,j));

    end
  end



end

image(:,:,1)=f_r;
image(:,:,2)=f_g;
image(:,:,3)=f_b;
imshow(image);

