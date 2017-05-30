image = imread('dani.jpg');

f_r = image(:,:,1);
f_g = image(:,:,2);
f_b = image(:,:,3);

%tamaños de la imagen:
[m,n] = size(f_r);

%________________________METODO TRAPECIOS_________________%


M=90;
%hallar h:
h = abs((m-n)/M);

for i=1:m-1
    
    for j=1:n-1
        
        f_r(i,j) = double((f_r(i,j)+f_r(i,j+1))*(h/2));
        
        f_g(i,j) = double((f_g(i,j)+f_g(i,j+1))*(h/2));
        
        f_b(i,j) = double((f_b(i,j)+f_b(i,j+1))*(h/2));
    end
end




image(:,:,1) = f_r;
image(:,:,2) = f_g;
image(:,:,3) = f_b;

imshow(image);