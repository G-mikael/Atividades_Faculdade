function [lambda, x1, k, n_error, clock1] = Metodo_potencia_1(A, x0, epsilon, M)
    // A função usa o metod da potencia para determinar o autovalor dominante de A
    // Input
    // A:  matriz real n x n, diagonalizável, com autovalor dominante (lambda);
    // x0: vetor, não nulo, a ser utilizado como aproximação inicial do autovetor dominante.
    // epsilon: precisão a ser usada no critério de parada.
    // M: número máximo de iterações.
    
    // Output:
    // lambda: autovalor dominante de A;
    // x1: autovetor unitário correspondente a lambda;
    // k: número de iterações necessárias para a convergência;
    // n_erro: norma infinito do erro
    // toc1: tempo gasto ao fim das iterações do algoritmo
    
    tic();
    k = 0;
    
    //Usaremos x0 sobre sua maior coordenada, usaremos max para obte-la
    [max_coordenada_modulo_x0, pos_x0] = max(abs(x0))
    
    if x0(pos_x0) < 0 then
        max_coordenada_modulo_x0 = - max_coordenada_modulo_x0;
    else
    end
    
    x0 = x0/max_coordenada_modulo_x0;
    x1 = A*x0; //Que nos retorna uma aproximação
    
    n_error = epsilon + 1;
    
    while (k <= M) & (n_error >= epsilon)        
    //Atualizaremos lambda como a coordenada de maior modulo de x1
    [max_coordenada_modulo_x1, pos_x1] = max(abs(x1));
    lambda = max_coordenada_modulo_x1;
    
    x1 = x1/lambda;
    n_error = norm((x1 - x0), "inf");
    
    x0 = x1;
    x1 = A*x0;
    k = k+1;
    end
    clock1 = toc();
    
    disp("autovalor dominante");
    disp(lambda);
    disp("Número de iterações");
    disp(k);
    disp("erro");
    disp(n_error);
    disp("tempo gasto (em segundos):");
    disp(clock1);
endfunction
