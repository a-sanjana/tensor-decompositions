% Step 1: Read the image
original_image = imread('Grey-input-1920.jpg'); % Replace 'your_image.jpg' with the actual image file

% Step 2: Convert to grayscale if needed
if size(original_image, 3) == 3
    gray_image = rgb2gray(original_image);
else
    gray_image = original_image;
end

% Step 3: Convert to double precision
image_matrix = double(gray_image);

% Set parameters for pseudoskeleton/skeleton decomposition
k = 256;  % Number of columns to choose
epsilon = 1e-6;  % Threshold for singular values

% Step 4: Apply pseudoskeleton/skeleton decomposition
[C,M, R] = pSkel(image_matrix, k, epsilon);

% Step 5: Reconstruct the compressed image matrix
compressed_image_matrix = C * M * R;

% Step 6: Display the original and compressed images
figure;

subplot(1, 2, 1);
imshow(uint8(image_matrix), []);
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(compressed_image_matrix), []);
title('Compressed Image');

% Step 7: Save the compressed image if needed
imwrite(uint8(compressed_image_matrix), 'Grey-compress-pSkel-256.jpg');

%img src = Unsplash