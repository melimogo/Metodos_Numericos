clear all, close all, clc;

function matrix = gauss(a)
  [m,n]=size(a);
  for j=1:m-1
      for z=2:m
          if a(j,j)==0
              t=a(1,:);
              a(1,:)=a(z,:);
              a(z,:)=t;
          end
      end
      for i=j+1:m
          a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
      end
  end

  for j=m:-1:2
      for i=j-1:-1:1
          a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
      end
  end

  for s=1:m
      a(s,:)=a(s,:)/a(s,s);
      x(s)=a(s,n);
  end
  matrix = a;
end

function matrix = flip(m)
  n = 2;

  x =  0:10:80;
  y = [18,24,35,44,59,72,91,109];
  y = y';
  a = ones(1, length(x));

  matrixT = [a; x];

  for i=2:n
    matrixT = [matrixT; x.^i];
  end

  FtF = mtimes(matrixT,matrixT');
  FtY = mtimes(matrixT,y);

  matrix = [FtF, FtY];

  matrix = gauss(matrix);

  matrix(:,length(matrix))
end


image = imread('dani.jpg');

% Separamos la imagen en las tres matrices RGB
image_red_matrix = image(:,:,1);
image_green_matrix = image(:,:,2);
image_blue_matrix = image(:,:,3);

image_red_matrix_flip = flip(image_red_matrix);
image_green_matrix_flip = flip(image_green_matrix);
image_blue_matrix_flip = flip(image_blue_matrix);

image(:,:,1) = image_red_matrix_flip;
image(:,:,2) = image_green_matrix_flip;
image(:,:,3) = image_blue_matrix_flip;
imshow(image)
