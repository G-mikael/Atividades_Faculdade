function [Q, R] = qr_GS(A)
    [m, n] = size(A);
    Q = zeros(m, n);
    R = zeros(n, n);
    
    for k = 1:n
        // Compute the k-th column of Q
        Q(:, k) = A(:, k);
        for j = 1:k-1
            R(j, k) = Q(:, j)' * A(:, k);
            Q(:, k) = Q(:, k) - R(j, k) * Q(:, j);
        end
        R(k, k) = norm(Q(:, k));
        Q(:, k) = Q(:, k) / R(k, k);
    end
endfunction
