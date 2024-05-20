function [autovalores_estimados] = estimar_autovalores_gerschgorin(A)
    n = size(A, 1);
    autovalores_estimados = zeros(n, 1);
    // Estimando os autovalores usando os Discos de Gerschgorin
    for i = 1:n
        raio = sum(abs(A(i, :))) - abs(A(i, i));
        autovalores_estimados(i) = A(i, i) + raio;
    end
end
