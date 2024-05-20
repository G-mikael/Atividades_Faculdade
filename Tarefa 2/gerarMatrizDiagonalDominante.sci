function [xk_gs, diff_norm_gs, k_gs] = aproximarSolucaoMatrizDiagonalDominante1(n)
    // Gera uma matriz A nxn diagonal estritamente dominante
    // e um vetor b compatível
    
    A = zeros(n, n);
    b = zeros(n, 1);

    // Preenchendo a matriz A com valores aleatórios
    for i = 1:n
        // Gerando os elementos da linha i de A
        for j = 1:n
            if i == j
                // A diagonal deve ser maior que a soma dos outros elementos na linha
                A(i, j) = rand() * n + sum(abs(A(i, :)));
            else
                A(i, j) = -rand() * n;
            end
        end
    end

    // Preenchendo o vetor b com valores aleatórios
    b = rand(n, 1) * n;
    
    x0 = zeros(n, 1);
    E = 1e-6;
    M = 1000
    
    tic();
    [xk_gs, diff_norm_gs, k_gs, residual_norm_gs] = gauss_seidel(A, b, x0, E, M, %inf);
    time = toc();

endfunction
