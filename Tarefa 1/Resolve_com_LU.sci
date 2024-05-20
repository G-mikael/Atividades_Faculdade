// Função para resolver sistemas lineares usando a decomposição LU
function X = Resolve_com_LU(C, B)
    [n, m] = size(B);
    X = zeros(n, m); // Inicializando a matriz de soluções
    
    for k = 1:m
        y = zeros(n, 1);
        
        // Resolvendo Ly = b usando substituição direta
        for i = 1:n
            y(i) = B(i, k);
            for j = 1:i-1
                y(i) = y(i) - C(i, j) * y(j);
            end
        end
        
        // Resolvendo Ux = y usando substituição retroativa
        x = zeros(n, 1);
        for i = n:-1:1
            x(i) = y(i);
            for j = i+1:n
                x(i) = x(i) - C(i, j) * x(j);
            end
            x(i) = x(i) / C(i, i);
        end
        
        X(:, k) = x; // Armazenando a solução na matriz de soluções X
    end
endfunction
