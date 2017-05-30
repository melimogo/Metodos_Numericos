
function pro = progresivas(f_R,f_G,f_B)
    
    [m,n]=size(f_R);
    disp(m);
    disp(n);
    
    %rojas
    rojo_1_u=f_R;
    rojo_2_u=f_R; 
    
    %abajo_arriba
    %rojo_1_u = columna_ab_ar(f_R,m,n);
    %rojo_2_u = fila_ab_ar(f_R,m,n);
    
    %arriba_Abajo derecha izquierda
    rojo_1_u = columna_ab_ar(f_R,m,n);
    rojo_2_u = fila_de_iz(f_R,m,n);
    
    
    rojo_t = rojo_1_u.*rojo_2_u;    
    
    
    %verdes
    g_1=f_G;
    g_2=f_G;

    %abajo_arriba
    %g_1 = columna_ab_ar(f_G,m,n);
    %g_2 = fila_ab_ar(f_G,m,n);
    
    %arriba_abajo
    g_1 = columna_ab_ar(f_G,m,n);
    g_2 = fila_de_iz(f_G,m,n);
    
    green_T = g_2.*g_1;
    
    %%azules

    b_1=f_B;
    b_2=f_B;
    
    %abajo_arriba
    %b_1 = columna_ab_ar(f_B,m,n);
    %b_2 = fila_ab_ar(f_B,m,n);

    %arriba_Abajo
    b_1 = columna_ab_ar(f_B,m,n);
    b_2 = fila_de_iz(f_B,m,n);
    
    
    blue_T = b_2.*b_1;
   
    %producto de todas las matrices Progresivas
    c_T = rojo_t.*blue_T;
    pro = c_T.*green_T;

end


function rc = columna_iz_de(f_R,m,n)
  rc = f_R;
  for i=1:m
      for j=1:n
        if j== n 
           rc(i,j) = abs(f_R(i,j) - f_R(i,1));  
        end
          rc(i,j) = abs(f_R(i,j) - f_R(i,j+1));        
      end      
   end
end   

function rc = columna_ab_ar(f_R,m,n)
  rc = f_R;
  for i=m:1
      for j=n:1
        if j == 1  
           rc(i,j) = abs(f_R(i,j) - f_R(i,n)) ;  
        end
         rc(i,j) = abs(f_R(i,j) - f_R(i,j-1)) ;        
      end      
   end
end 

function rf = fila_ar_ab(f_R,m,n)
  rf = f_R;
    for j=1:n
      for i=1:m
        if i == m 
           rc(i,j) = abs(f_R(i,j) - f_R(1,j)) ;  
        end
          rf(i,j) = abs(f_R(i,j) - f_R(i+1,j)) ;  
        end
     end
end

function rf = fila_de_iz(f_R,m,n)
  rf = f_R;
    for j=n:1
      for i=m:1
        if i == 1
           rc(i,j) = abs(f_R(i,j) - f_R(n,j));  
        end
          rf(i,j) = abs(f_R(i,j) - f_R(i-1,j)) ;  
        end
     end
end



