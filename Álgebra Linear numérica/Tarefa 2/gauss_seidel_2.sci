function [xk, diff_norm, k, residual_norm] = gauss_seidel_2(A, b, x0, E, M, norm_type)
    // Inicialização das variáveis
    n = length(b);
    xk = x0;  // Aproximação inicial da solução
    k = 0;   // Contador de iterações
    
    // Decomposição da matriz A em matriz diagonal (D) e matrizes triangular inferior (L) e superior (U)
    D = diag(diag(A));
    L = tril(A) - D;
    U = triu(A) - D;
    
    // Loop principal do algoritmo de Gauss-Seidel com matriz triangular inferior
    while k < M
        x_prev = xk;  // Aproximação anterior da solução
        
        
        // Atualização de cada componente da solução xk
        for i = 1:n
            xk(i) = (b(i) + U(i,:) * xk - L(i,:) * x_prev) / D(i,i);
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
