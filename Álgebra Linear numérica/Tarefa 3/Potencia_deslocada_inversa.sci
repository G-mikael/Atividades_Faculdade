function [lambda1,x1,k,n_erro] = Potencia_deslocada_inversa (A,x0,epsilon,alfa,M)
    // Inicialização de variáveis
    k = 0;
    n = size(A, 1); // Obtendo o tamanho da matriz A para fazer uma matriz identidade do tamanho correto
    x0 = x0 / norm(x0, 2);
    n_erro = epsilon + 1;
    
    // Loop principal
    while k <= M & n_erro >= epsilon
        // Resolvendo o sistema (A - alfa*I)*x1 = x0 usando a função Gaussian_Elimination_4
        [x1, C_, P_] = Gaussian_Elimination_4(A - alfa*eye(n), x0);
        x1 = x1 / norm(x1, 2);
        
        // Cálculo do quociente de Rayleigh
        lambda = x1' * A * x1;
        
        // Verificando o sinal do produto interno entre x1 e x0
        if x1' * x0 < 0
            x1 = -x1;
        end
        
        // Cálculo da norma do erro
        n_erro = norm(x1 - x0, 2);
        
        // Atualização das variáveis
        x0 = x1;
        k = k + 1;
    end
    
    lambda1 = lambda + alfa
endfunction
