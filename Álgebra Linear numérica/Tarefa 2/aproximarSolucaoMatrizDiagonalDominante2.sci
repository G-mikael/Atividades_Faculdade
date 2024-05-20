function [diff_norm_gs, k_gs, time] = aproximarSolucaoMatrizDiagonalDominante2(n)
    // Gera uma matriz A nxn diagonal estritamente dominante
    // e um vetor b compatível
    
    // Inicializa a matriz A como uma matriz n x n de zeros
    A = zeros(n, n);
    
    // Preenche a matriz A com valores aleatórios entre 1 e 9
    for i = 1:n
        for j = 1:n
            A(i, j) = round(rand() * 8) + 1; // Valores entre 1 e 9
        end
    end
    
    // Faz a matriz diagonalmente dominante
    for i = 1:n
        soma_linha = sum(abs(A(i, :))) - abs(A(i, i)); // Soma dos elementos da linha excluindo o elemento diagonal
        A(i, i) = soma_linha + 1; // Ajusta o elemento diagonal para tornar a linha dominante
    end
    
    // Cria um vetor b válido
    b = rand(n, 1);
    
    x0 = zeros(n, 1);
    E = 1e-6;
    M = 25
    
    //Vamos então fazer a aproximação com a matriz criada e 25 iterações com matriz de zeros como chute inicial
    tic();
    [xk_gs, diff_norm_gs, k_gs, residual_norm_gs] = gauss_seidel_2(A, b, x0, E, M, %inf);
    time = toc();

endfunction
