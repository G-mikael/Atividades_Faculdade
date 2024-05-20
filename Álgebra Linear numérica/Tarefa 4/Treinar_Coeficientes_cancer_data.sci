function [coeficientes] = Treinar_Coeficientes_cancer_data(data)
    // Obtendo o número de colunas da matriz de dados para a elaboração de uma matriz de coeficientes do tamanho correto
    [num_linhas, num_colunas] = size(data);
    //"num_colunas - 1" é o número de features que faremos a combinação linear com os coeficientes
    coeficientes = zeros(num_colunas - 1, 1);
    
endfunction
