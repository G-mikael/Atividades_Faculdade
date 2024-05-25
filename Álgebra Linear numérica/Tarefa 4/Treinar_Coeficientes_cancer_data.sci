function [coeficientes] = Treinar_Coeficientes_cancer_data(data, num_de_indices)
    // Obtendo o número de colunas da matriz de dados para a elaboração de uma matriz de coeficientes do tamanho correto
    [num_linhas, num_colunas] = size(data);
    //"num_colunas - 1" é o número de features que faremos a combinação linear com os coeficientes
    coeficientes = zeros(num_colunas - 1, 1);
    
    // Preparar a matriz de regressão
    // Usaremos todas as colunas menos a última
    num_colunas_A = num_colunas-1
    
    A = data(:, 1:num_colunas_A);
    vetor_b = data(:, num_colunas);
    
    // Ajustar o modelo linear usando regressão
    [coeficientes, gauss_, perm_] = Gaussian_Elimination_4((A' * A), (A' * vetor_b));
    
endfunction
