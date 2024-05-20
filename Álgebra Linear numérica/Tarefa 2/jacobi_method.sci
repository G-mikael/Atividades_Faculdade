function [xk, diff_norm, k, residual_norm] = jacobi_method(A, b, x0, E, M, norm_type)
    n = length(b);        // Obtém o tamanho do vetor b para determinar a dimensão da matriz A
    xk = x0;              // Inicializa o vetor de solução com a aproximação inicial
    x_prev = x0;          // Inicializa um vetor para armazenar a solução da iteração anterior
    k = 0;                // Inicializa o contador de iterações
    
    while k < M           // Executa o loop até atingir o número máximo de iterações
        x_prev = xk;      // Atualiza a solução da iteração anterior
        
        // Calcula a nova solução para cada componente de xk
        for i = 1:n
            sigma = 0;    // Inicializa a variável para acumular a soma dos termos
            for j = 1:n
                if j ~= i  // Exclui o elemento da diagonal principal
                    sigma = sigma + A(i, j) * x_prev(j);  // Soma os termos não diagonais
                end
            end
            xk(i) = (b(i) - sigma) / A(i, i);  // Calcula o novo valor para xk(i)
        end
        
        k = k + 1;   // Atualiza o contador de iterações
        
        // Verifica o critério de parada
        diff_norm = norm(xk - x_prev, norm_type);           // Calcula a norma da diferença entre as soluções
        residual_norm = norm(b - A * xk, norm_type);        // Calcula a norma do resíduo
        if diff_norm < E   // Verifica se a norma da diferença é menor que a tolerância
            break;         // Se sim, sai do loop
        end
    end
end
