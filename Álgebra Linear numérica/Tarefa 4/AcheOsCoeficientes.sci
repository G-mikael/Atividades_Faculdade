function [b, alpha, alpha_] = AcheOsCoeficientes(data)
    P = data(:,2);
    L = data(:,3);
    K = data(:,4);
    
    // Transformar os dados para a forma logarítmica
    Y = log(P);
    X1 = log(L);
    X2 = log(K);
    
    // Preparar a matriz de regressão
    A = [ones(Y), X1, X2];
    
    // Ajustar o modelo linear usando regressão
    [x, gauss, perm] = Gaussian_Elimination_4((A' * A), (A' * P));
    
    // Extrair os coeficientes
    ln_b = x(1);
    alpha = x(2);
    alpha_ = x(3);
    
    // Calcular b a partir de ln(b)
    b = exp(ln_b);
    
    // Mostrar os resultados
    disp("Valor de b:");
    disp(b);
    disp("Valor de α:");
    disp(alpha);
    disp("Valor de (1-α):");
    disp(alpha_);

endfunction
