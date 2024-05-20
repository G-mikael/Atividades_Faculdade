function [A] = MatrizSimetricaAleatoria(n)
// n: Tamanho da matriz
A = rand(n, n);
A = A + A'; // Tornando a matriz simétrica pois sabemos que qualquer A^T * A é simétrica
end
