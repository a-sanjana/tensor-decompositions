function [C, G, R] = Skel(A, k)
    % Step 1: Choose k columns randomly from the matrix A
    J = randperm(size(A, 2), k);
    C = A(:, J);

    % Step 2: Use maxvol procedure on C to get k row indices I
    ind = maxvol2(C);
    R = A(ind, :);

    % Step 3: Construct the matrix M
    M = A(ind, J);

    % Step 4: Finf G
    G = inv(M);

end
