// Função para execução da eliminação gaussiana com escolha do maior pivô em módulo no início da iteração j
// 
// Parâmetros:
//    A: Matriz dos coeficientes do sistema linear
//    b: Vetor do lado direito do sistema linear
// 
// Saída:
//    x: Vetor de soluções do sistema linear
//    C: Matriz resultante após a eliminação gaussiana
//    P: Matriz de permutação utilizada durante a eliminação
function [x, C, P] = Gaussian_Elimination_4(A, b)
    // Obtendo as dimensões da matriz A
    [n, m] = size(A);
    // Combinando a matriz de coeficientes A com o vetor do lado direito b
    C = [A, b]; 
    // Inicializando a matriz de permutação como a matriz identidade
    P = eye(A);
    
    // Iterando sobre as colunas da matriz (etapas da eliminação)
    for j = 1:(n - 1)
        // Escolhendo o maior pivô em módulo
        [h, max_row] = max(abs(C(j:n, j)));
        max_row = max_row + j - 1;
        // Realizando a permutação de linhas se houver valor maior em módulo
        if max_row ~= j
            C([j, max_row], :) = C([max_row, j], :);
            //Fazendo a permutação de linhas também na matriz de permutação
            P([j, max_row], :) = P([max_row, j], :);
        end
        // Atualizando os elementos abaixo do pivô atual
        for i = (j + 1):n
            C(i, j) = C(i, j) / C(j, j);
            C(i, j + 1:m + 1) = C(i, j + 1:m + 1) - C(i, j) * C(j, j + 1:m + 1);
        end
    end
    
    // Calculando as soluções do sistema linear
    x = zeros(n, 1);
    x(n) = C(n, m + 1) / C(n, n);
    for i = n - 1:-1:1
        x(i) = (C(i, m + 1) - C(i, i + 1:n) * x(i + 1:n)) / C(i, i);
    end
    // Ajustando a matriz resultante para conter apenas os elementos
    // correspondentes ao sistema original
    C = C(1:n, 1:m);
endfunction
