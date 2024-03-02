function [C,M, R] = pSkel(A, k, epsilon)
    % Step 1: Choose k columns randomly from the matrix A
    J = randperm(size(A, 2), k);
    C = A(:, J);

    % Step 2: Use maxvol procedure on C to get k row indices I
    ind = maxvol2(C);
    R = A(ind, :);

    % Step 3: Apply SVD to the matrix M
    M = A(ind, J);
    [U_M, S_M, V_M] = svd(M);

    % Step 4: Fix epsilon and find r singular values satisfying the condition
    r = sum(diag(S_M) > epsilon);

    % Step 5: Truncate matrices U_M, V_M, and S_M
    U_r = U_M(:, 1:r);
    V_r = V_M(:, 1:r);
    S_r = S_M(1:r, 1:r);

    % Step 6: Find the pseudoinverse of M
    tol =  1.882938e-13;
    M_pseudo_inv = pinv(M, tol);

    % Step 7: Alternate
    M= M_pseudo_inv;
end
