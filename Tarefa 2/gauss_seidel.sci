function [xk, diff_norm, k, residual_norm] = gauss_seidel(A, b, x0, E, M, norm_type)
    // Inicialização das variáveis
    n = length(b);
    xk = x0;  // Aproximação inicial da solução
    k = 0;    // Contador de iterações
    
    // Decomposição da matriz A em matriz diagonal (D) e matrizes triangular inferior (L) e superior (U)
    D = diag(diag(A));
    L = tril(A) - D;
    U = triu(A) - D;
    
    // Cálculo da matriz inversa de (D + L) e do vetor (D + L)^{-1}b
    DL_inv = inv(D + L);
    DL_inv_b = DL_inv * b;
    
    // Loop principal do algoritmo de Gauss-Seidel
    while k < M
        x_prev = xk;  // Aproximação anterior da solução
        
        // Atualização de cada componente da solução xk
        for i = 1:n
            xk(i) = DL_inv_b(i) - DL_inv(i,:) * (U * xk);
        end
        
        k = k + 1;  // Incremento do contador de iterações
        
        // Cálculo das normas da diferença entre as duas últimas aproximações e do resíduo
        diff_norm = norm(xk - x_prev, norm_type);
        residual_norm = norm(b - A * xk, norm_type);
        
        // Critério de parada do algoritmo
        if diff_norm < E || k >= M
            break;
        end
    end
endfunction
