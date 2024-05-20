// Função para execução da eliminação gaussiana
// 
// Parâmetros:
//    A: Matriz dos coeficientes do sistema linear
//    b: Vetor do lado direito do sistema linear
// 
// Saída:
//    x: Vetor de soluções do sistema linear
//    C: Matriz resultante após a eliminação gaussiana
function [x, C] = Gaussian_Elimination_2(A, b)
    // Combinando a matriz de coeficientes A com o vetor b
    C = [A, b]; 
    // Obtendo o número de linhas da matriz C
    [n] = size(C, 1);
    
    // Iterando sobre as colunas da matriz e sobre as linhas abaixo da diagonal
    // principal
    for j = 1:(n - 1)
        // Troca de linhas se o elemento diagonal for zero
        if C(j, j) == 0
            C([j, find(C(j:n, j), 1) + j - 1], :) = C([find(C(j:n, j), 1) + j - 1, j], :);
        end
        
        for i = (j + 1):n
            // Calculando o fator de eliminação e atualizando os elementos 
            // abaixo da diagonal principal
            C(i, j) = C(i, j) / C(j, j);
            C(i, j + 1:n + 1) = C(i, j + 1:n + 1) - C(i, j) * C(j, j + 1:n + 1);
        end
    end
    //Gerando o vetor de soluções
    x = zeros(n, 1);
    // Calculando a última solução (x_n)
    x(n) = C(n, n + 1) / C(n, n);
    // Iterando para calcular as soluções restantes de x retroativamente
    for i = n - 1:-1:1
        x(i) = (C(i, n + 1) - C(i, i + 1:n) * x(i + 1:n)) / C(i, i);
    end
    C = C(1:n, 1:n);
endfunction
