
function cen = centradas(f_R,f_G,f_B)
    
    [m,n]=size(f_R);
    disp(m);
    disp(n);
    
    %rojas
    r_1 = f_R;
    r_1 = central(f_R,m,n);
    

    %verdes
    g_1=f_G;
    g_1 = central(f_G,m,n);
   
    
    %%azules

    b_1=f_B;
    b_1 = central(f_B,m,n);
    
    %producto de todas las matrices centradas
    c = g_1.*r_1;
    cen = c.*b_1;

end


function rc = central(f,m,n)
  rc = f;
  for i=1:m
      for j=1:n
         rc(i,j) = f(i,j-1) - f(i,j);        
      end      
   end
end   

