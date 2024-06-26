function [Vetor_previsoes] = Fazer_Previsoes_cancer_data(coeficientes, data)
    // Obtendo o número de colunas da matriz de dados para a elaboração de uma matriz de coeficientes do tamanho correto
    [num_linhas, num_colunas] = size(data);
    
    num_colunas_A = num_colunas-1
   
    Vetor_y = data(:, 1:num_colunas_A) * coeficientes;
   
   //Temos podemos obter um vetor de booleano, mas nesse caso usaremos um vetor de 1 e -1
   //2 * (vetor_y > 0) nos dá valores dois e zeros subtraindo 1 temos 1 para os verdadeiros e -1 para os falsos
    Vetor_previsoes = 2 * (Vetor_y > 0) - 1;
endfunction
