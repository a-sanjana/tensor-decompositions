% Step 1: Read the color image
original_color_image = imread('Color-input-1920.jpg'); % Replace 'your_color_image.jpg' with the actual image file

% Step 2: Convert to double precision
color_image_matrix = double(original_color_image);

% Set parameters for pseudoskeleton/skeleton decomposition
k = 1024;  % Number of columns to choose
epsilon = 1e-6;  % Threshold for singular values

% Initialize matrices for decomposed channels
compressed_R = zeros(size(color_image_matrix(:,:,1)));
compressed_G = zeros(size(color_image_matrix(:,:,2)));
compressed_B = zeros(size(color_image_matrix(:,:,3)));

% Apply pseudoskeleton decomposition to each color channel
for channel = 1:3
    [C,G, R] = pSkel(color_image_matrix(:,:,channel), k, epsilon);
    
    % Reconstruct the compressed channel
    compressed_channel = C * G * R;
    
    % Store the compressed channel
    switch channel
        case 1
            compressed_R = compressed_channel;
        case 2
            compressed_G = compressed_channel;
        case 3
            compressed_B = compressed_channel;
    end
end

% Combine the compressed channels into a color image
compressed_color_image = uint8(cat(3, compressed_R, compressed_G, compressed_B));

% Display the original and compressed images
figure;

subplot(1, 2, 1);
imshow(uint8(color_image_matrix), []);
title('Original Color Image');

subplot(1, 2, 2);
imshow(compressed_color_image, []);
title('Compressed Color Image');

% Save the compressed image if needed
imwrite(compressed_color_image, 'Color-compress-pSkel-1024.jpg');
