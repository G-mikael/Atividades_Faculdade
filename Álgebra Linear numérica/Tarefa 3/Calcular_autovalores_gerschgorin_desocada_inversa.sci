function [A, v0, aval_supos, aval_real] = Calcular_autovalores_gerschgorin_desocada_inversa(n)
    // Gerando uma matriz aleatória A simétrica
    A = MatrizSimetricaAleatoria(n);
    
    // Geramos estimativas dos autovalores usando os discos de Gerschgorin
    v0 = estimar_autovalores_gerschgorin(A);
    
    // Para cada estimativa, vamos usar a potência deslocada e descobrir o autovalor mais próximo
    x0 = rand(n, 1); // Vetor inicial aleatório
    epsilon = 1e-6; // Precisão desejada
    M = 100; // Número máximo de iterações
    
    aval_supos = zeros(n, 1);
    
    for i = 1:n
        [lambda1,x1,k,n_erro] = Potencia_deslocada_inversa(A,x0,epsilon,v0(i),M);
        aval_supos(i) = lambda1;
    end
    
    // Ao fim da iteração temos todas as suposições e compararemos então com os autovalores reais
    aval_real = spec(A);
    disp("Suposições de Autovalores:");
    disp(aval_supos);
    disp("Autovalores Reais:");
    disp(aval_real);
endfunction
