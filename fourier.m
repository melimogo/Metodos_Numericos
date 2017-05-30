% 
image = imread('circulo.png');

f_w = im2double(rgb2gray(image));
%f_b = image(:,:,2);
figure
imshow(f_w)
%tamaños de la imagen:
[m,n] = size(f_w);
vec = ones(1,n*n);
matriz = zeros(m,n);
mat = zeros(m,n);
for u=1: m
  for v=1:n
      %suma = 0;
      for x=1:m-1
          for y=1:n-1
              matriz(u,v) = matriz(u,v) + f_w(x,y)*exp((-1i*2*pi)*(((u*x)/m)+((v*y)/n)));
          end    
      end
  end  
end

m_f = int8(m/2);
m_c = int8(n/2);


c_1 = matriz(1:m_f-1,m_c:n);
c_2 = matriz(1:m_f-1,1:m_c-1);
c_3 = matriz(m_f:m,1:m_c-1);
c_4 = matriz(m_f:m,m_c:n);

mat = [c_4 c_3 ; c_1 c_2];


[f,c]=size(f_w);
cx=c/2;cy=f/2;ix=c;iy=f;r=20;
[x,y]=meshgrid(-(cx-1):(ix-cx),-(cy-1):(iy-cy));
c_mask=((x.^2+y.^2)>=r^2);

mat = mat.*c_mask;

matrizInversa = zeros(m,n);
for x=1: m
  for y=1:n
      %suma = 0;
      for u=1:m-1
          for v=1:n-1
              matrizInversa(x,y) = matrizInversa(x,y) + ( mat(u,v)*exp((1i*2*pi)*(((u*x)/m)+((v*y)/n))) )/(m*n);
          end    
      end
  end  
end

m_f = m/2;
m_c = n/2;


c_1 = matrizInversa(1:m_f-1,m_c:n);
c_2 = matrizInversa(1:m_f-1,1:m_c-1);
c_3 = matrizInversa(m_f:m,1:m_c-1);
c_4 = matrizInversa(m_f:m,m_c:n);

matNueva = [c_4 c_3 ; c_1 c_2];


imshow(abs(matNueva));
