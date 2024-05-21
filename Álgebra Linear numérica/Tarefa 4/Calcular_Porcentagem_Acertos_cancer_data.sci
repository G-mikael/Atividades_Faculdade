function [porcentagem_acertos] = Calcular_Porcentagem_Acertos(predicoes, data)
    [num_linhas, num_colunas] = size(data);
    
    rotulos_reais = data(:, num_colunas);
    // Calcula a porcentagem de acertos entre as previsões e os rótulos reais
    num_acertos = sum(predicoes == rotulos_reais);
    porcentagem_acertos = (num_acertos / length(rotulos_reais)) * 100;
endfunction
