function [Q, R, P] = qr_GSP(A)
    // Obtém as dimensões da matriz A
    [m, n] = size(A);

    // Inicializa as matrizes Q, R e o vetor de permutação P
    Q = zeros(m, n);
    R = zeros(n, n);
    P = 1:n;  // Vetor de permutação inicial (identidade)

    // Inicializa o vetor de normas das colunas de A
    norms = zeros(1, n);
    for k = 1:n
        norms(k) = norm(A(:, k));
    end

    for k = 1:n
        // Encontra a coluna com a maior norma a partir da coluna k
        [val_, idx] = max(norms(k:n));
        idx = idx + k - 1;

        // Permuta a coluna k com a coluna idx em A, norms e P
        A(:, [k, idx]) = A(:, [idx, k]);
        norms([k, idx]) = norms([idx, k]);
        P([k, idx]) = P([idx, k]);

        // Normaliza a coluna k de A e a atribui à coluna k de Q
        R(k, k) = norm(A(:, k));
        Q(:, k) = A(:, k) / R(k, k);

        // Subtrai a projeção da coluna k de A das colunas restantes
        for j = k+1:n
            R(k, j) = Q(:, k)' * A(:, j);
            A(:, j) = A(:, j) - Q(:, k) * R(k, j);
        end

        // Recalcula as normas das colunas restantes
        for j = k+1:n
            norms(j) = norm(A(:, j));
        end
    end

    // Ajusta a matriz de permutação P para ser uma matriz de permutação completa
    P = eye(n)(:, P);
endfunction
