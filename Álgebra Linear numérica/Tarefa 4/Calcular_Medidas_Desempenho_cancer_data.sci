function [confusion_matrix, acuracia, precisao, recall, prob_falso_alarme, prob_falsa_omissao] = Calcular_Medidas_Desempenho(predicoes, data)
    
    [num_linhas, num_colunas] = size(data);
    rotulos_reais = data(:, num_colunas);
    
    // Classes esperadas
    classes = [-1, 1];
    
    // Inicializa a matriz de confusão
    confusion_matrix = zeros(2, 2);
    
    // Preenche a matriz de confusão
    for i = 1:length(predicoes)
        if predicoes(i) == classes(1)
            if rotulos_reais(i) == classes(1)
                confusion_matrix(1, 1) = confusion_matrix(1, 1) + 1; // True Negative
            else
                confusion_matrix(1, 2) = confusion_matrix(1, 2) + 1; // False Negative
            end
        else
            if rotulos_reais(i) == classes(1)
                confusion_matrix(2, 1) = confusion_matrix(2, 1) + 1; // False Positive
            else
                confusion_matrix(2, 2) = confusion_matrix(2, 2) + 1; // True Positive
            end
        end
    end
    
    // Extrai os valores da matriz de confusão
    TN = confusion_matrix(1, 1);
    FN = confusion_matrix(1, 2);
    FP = confusion_matrix(2, 1);
    TP = confusion_matrix(2, 2);
    
    // Calcula as medidas de desempenho
    total = TN + FN + FP + TP;
    acuracia = (TP + TN) / total;
    precisao = TP / (TP + FP);
    recall = TP / (TP + FN);
    prob_falso_alarme = FP / (FP + TN);
    prob_falsa_omissao = FN / (FN + TP);
endfunction

