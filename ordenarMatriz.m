function matrizOrdenada = ordenarMatriz(matriz)

  [n,m]= size(matriz);
  matrizOrdenada= matriz;

        for i=1:n
           [minimo, p] = min(abs(matriz(:,1)));
            matrizOrdenada(i,1)= matriz(p,1);
            matrizOrdenada(i,2)= matriz(p,2);
            matriz(p,1)= NaN;

        end

end