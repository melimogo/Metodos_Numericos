


image = imread('mel.jpg');

f_r = image(:,:,1);
f_g = image(:,:,2);
f_b = image(:,:,3);

%tamaños de la imagen:
[m,n] = size(f_r);

%________________________METODO TRAPECIOS_________________%


M=;
%hallar h:
h = (1)/M;



for i=1:m-1
    for j=1:n-1
        f_r(i,j) = (f_r(i,j)+f_r(i,j+1))*(h/2);
        
        f_g(i,j) = (f_g(i,j)+f_g(i,j+1))*(h/2);
        
        f_b(i,j) = (f_b(i,j)+f_b(i,j+1))*(h/2);
    end
end


%________________________METODO SIMPSON 1/3_______________________%
M=1;
%hallar h:
h = 3;
% vec = zeros(1,M);
% for i=1:M
%     vec(i) = 
% end


for i=1:m-2
    for j=1:n-2
        f_r(i,j) = (f_r(i,j)+4*f_r(i,j+1)+f_r(i,j+2))*(h/3);
        
        f_g(i,j) = (f_g(i,j)+4*f_g(i,j+1)+f_g(i,j+2))*(h/3);
        
        f_b(i,j) = (f_b(i,j)+4*f_b(i,j+1)+f_b(i,j+2))*(h/3);
    end
end

%______________________METODO SIMPSON 3/8______________________%

M=1;
%hallar h:
h = 2.8;
% vec = zeros(1,M);
% for i=1:M
%     vec(i) = 
% end


for i=1:m
    for j=1:n-3
        f_r(i,j) = (f_r(i,j)+3*f_r(i,j+1)+3*f_r(i,j+2)+f_r(i,j+3))*(3*h/8);
        
        f_g(i,j) = (f_g(i,j)+3*f_g(i,j+1)+3*f_g(i,j+2)+f_g(i,j+3))*(3*h/8);
        
        f_b(i,j) = (f_b(i,j)+3*f_b(i,j+1)+3*f_b(i,j+2)+f_b(i,j+3))*(3*h/8);
    end
end




image(:,:,1) = f_r;
image(:,:,2) = f_g;
image(:,:,3) = f_b;

imshow(image);



