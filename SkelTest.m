% Define the size of the matrix
s = 100;  % You can adjust the size as needed

% Generate matrix A
x = linspace(-1, 1, s);
y = linspace(-1, 1, s);
A = zeros(s, s);

for i = 1:s
    for j = 1:s
        A(i, j) = 1.0 / (1 + x(i)^2 + y(j)^2);
    end
end

% Set parameters for pseudoskeleton decomposition
k = 5;  % Number of columns to choose

% Invoke pseudoskeleton decomposition
[C,G,R] = sktest(A, k);

% Reconstruct the matrix
A_hat = C * G * R;

% Compute the Frobenius norm of the error
error_norm = norm(A - A_hat, 'fro');

% Display the result
%disp('Original matrix A:');
%disp(A);
%disp('Reconstructed matrix A_hat:');
%disp(A_hat);
disp('Frobenius norm of the error:');
disp(error_norm);
