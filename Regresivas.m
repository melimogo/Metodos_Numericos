

function reg = Regresivas(f_G,f_B,f_R)
    
    [m,n]=size(f_R);
    disp(m);
    disp(n);
    
    %rojas
    r_1=f_R;
    r_2=f_R; 
    r_3=f_R;
    r_4=f_R; 
    
    r_1 = columna(f_R,m,n);
    r_2 = fila(f_R,m,n);
    r_3 = subir(f_R,m,n);
    r_4 = izquierda(f_R,m,n);
    
    rojo_t = r_3.*r_4;    

    %verdes
    g_1=f_G;
    g_2=f_G;
    g_3=f_G;
    g_4=f_G;

    g_1 = columna(f_G,m,n);
    g_2 = fila(f_G,m,n);
    g_3 = subir(f_G,m,n);
    g_4 = izquierda(f_G,m,n);
    
    green_T = g_3.*g_4;
    
    %%azules

    b_1=f_B;
    b_2=f_B;
    b_3=f_B;
    b_4=f_B;

    b_1 = columna(f_B,m,n);
    b_2 = fila(f_B,m,n);
    b_3 = subir(f_B,m,n);
    b_4 = izquierda(f_B,m,n);

    blue_T = b_3.*b_4;
    
   
    %producto de las matrices Regresivas
    reg = rojo_t.*blue_T.*green_T;
end
  
function rc = columna(f_R,m,n)
    rc = f_R;
    for i=1:m-1
      for j=1:n-1
         rc(i,j) = f_R(i,j+1) - f_R(i,j);        
        end      
    end
end   

function rc = izquierda(f_R,m,n)
  rc = f_R;
  for i=m:2
      for j=n:2
         rc(i,j) = f_R(i,j-1) - f_R(i,j);        
      end      
   end
end   

function rc = subir(f_R,m,n)
  rc = f_R;
  for j=n:2
      for i=m:2
         rc(i,j) = f_R(i-1,j) - f_R(i,j);        
      end      
   end
end   

function rf = fila(f_R,m,n)
  rf = f_R;
    for j=1:n-1
      for i=1:m-1
         rf(i,j) = f_R(i+1,j) - f_R(i,j);  
        end
     end
end