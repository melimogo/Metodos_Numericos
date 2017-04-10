function matriz = gaussJordanm(matriz)
    for i=1:length(matriz(:,1)) %%para i desde la primera fila  hasta el número de filas existentes 
    if matriz(i,i)~=1 %%si el elemento i,i de la diagonal es diferente de 1 
        matriz(i,:)= matriz(i,:)./matriz(i,i);  %entonces se convierte a 1  dividiendo toda la fila por dicho elemento
        
    end
    %además el resto de elementos de la columna deben convertirse a 0 :  
    %es decir si  n es diferente de i ya que si i y n son iguales entonces el
    %elemento se encuentra en la diagonal 
        for n=1:length(matriz(:,1)) %para n desde la primera fila hasta el número de filas existentes
          if n~=i % si n en la columna i no está en la diagonal es decir si i no es igual a n
              matriz(n,:)=-matriz(n,i).*matriz(i,:)+matriz(n,:); %entonces se convierte a 0 
               
          end
        end
    end
end