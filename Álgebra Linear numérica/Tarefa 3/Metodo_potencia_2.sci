function [lambda, x1, k, n_error, clock1] = Metodo_potencia_2(A, x0, epsilon, M)
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
    // clock1: tempo percorrido ao longo das iterações
    
    tic();
    k = 0;
    
    //Usaremos x0 sobre sua maior coordenada, usaremos max para obte-la
    x0 = x0/norm(x0, 2);
    x1 = A*x0; //Que nos retorna uma aproximação do autovetor dominante
    
    n_error = epsilon + 1;
    
    while (k <= M) & (n_error >= epsilon)        
        //Atualizaremos lambda como o escalar de x1 e x0
        lambda =  (x1')*x0;
        
        if lambda<0 then
            x1 = -x1;
        end
        
        x1 = x1/norm(x1,2);
        n_error = norm(x1-x0,2);
        
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
