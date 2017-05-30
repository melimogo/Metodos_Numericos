% TRANSFORMACI�N DE IMAGEN YCbCr a RGB UTILIZANDO ELIMINACI�N DE GAUSS-JORDAN
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%   Y      16        0.183 0.614 0.062    R
%   Cb  =  128   +  -0.101 -0.339 0.439   G
%   Cr     128      0.439 -0.339 -0.040   B
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all                               %Eliminaci�n de las variables anteriores
clc                                     %Limpiar ventana de comandos
load 'image';                           %Se carga la imagen desde archivo .mat

A=[0.183 0.614 0.062;                   %Se inicializa la matriz del sistema
  -0.101 -0.339 0.439;
  0.439 -0.339 -0.040];

b_ = [16;
     128;
     128];

[filas, columnas, n] = size(image);   %Obtenci�n del tama�o de la imagen

ImagenRGB(filas,columnas,3)=0;        %Inicializaci�n de la matriz que contendr�
                                      % la imagen en RGB

for j =1:columnas                     %Ciclo anidado para recorrer toda la imagen YCbCr
    for i=1:filas
        yCbCr = [image(i,j,1);        %Se obtiene el valor del pixel (i,j) para cada plano
                 image(i,j,2);
                 image(i,j,3)];

        b = double(yCbCr)-b_;        %Se obtiene el vector b como la resta del pixel y el rango Y Cb Cr
        RGB=fungaussjor(A,b);        %Llamado a la funci�n Gauss-Jordan que retorna el RGB para el pixel (i,j)

        ImagenRGB(i,j,1)=RGB(1);     %Se escribe sobre la Imagen RGB cada nuevo pixel hallado en la conversi�n
        ImagenRGB(i,j,2)=RGB(2);
        ImagenRGB(i,j,3)=RGB(3);
    end
end

imshow(image)                      %Se muestra la imagen en YCbCr
figure
imshow(uint8(ImagenRGB))            %Se muestra la imagen en RGB


