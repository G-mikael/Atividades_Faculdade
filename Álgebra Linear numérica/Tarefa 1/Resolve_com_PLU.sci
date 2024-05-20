// Função para resolver sistemas lineares utilizando a decomposição PLU
// 
// Parâmetros:
//    P: Matriz de permutação
//    C: Matriz resultante da decomposição PLU
//    B: Matriz contendo os vetores de lado direito do sistema linear
// 
// Saída:
//    X: Matriz contendo as soluções dos sistemas lineares correspondentes aos vetores em B
function X = Resolve_com_PLU(P, C, B)
    [n, m] = size(B);
    //Inicializando a matriz de soluções
    X = zeros(n, m); 
    
    for k = 1:m
        //Aplicando a matriz de permutação ao vetor B
        b_permuted = P * B(:, k);
        
        y = zeros(n, 1);
        
        //Resolvendo Ly = Pb usando substituição direta
        for i = 1:n
            y(i) = b_permuted(i);
            for j = 1:i-1
                y(i) = y(i) - C(i, j) * y(j);
            end
        end
        
        //Resolvendo Ux = y usando substituição retroativa
        x = zeros(n, 1);
        for i = n:-1:1
            x(i) = y(i);
            for j = i+1:n
                x(i) = x(i) - C(i, j) * x(j);
            end
            x(i) = x(i) / C(i, i);
        end
        
        //Armazenando a solução na matriz de soluções X
        X(:, k) = x; 
    end
end
