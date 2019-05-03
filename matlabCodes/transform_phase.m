%% 2D FFT
clear; close all; clc

%% Image Data
A = imread('lena.gif');

figure(1)
imshow(A)
title('Original Image')
impixelinfo

%% 2D Fourier Transform - Real & Imaginary
F = fft2(double(A));

figure(2)
set(2, 'Position', [867 722 849 385])
subplot(1,2,1), imshow(fftshift(real(F)))
title('2-D DFT - Real Part')

subplot(1,2,2), imshow(fftshift(imag(F)))
title('2-D DFT - Imaginary Part')

%% 2D Fourier Transform - Magnitude & Phase
Fm = abs(F);
Fp = angle(F);

figure(3)
set(3, 'Position', [867 290 849 385])
subplot(1,2,1), imshow(fftshift(Fm/20000))
title('2-D DFT - Magnitude')

subplot(1,2,2), imshow(fftshift(Fp))
title('2-D DFT - Phase')

%% Image Reconstruction from Magnitude & Phase
G = complex(Fm.*cos(Fp), Fm.*sin(Fp));
B = real(ifft2(G));

figure(1)
imshow(B/255)
title('Both Magnitude & Phase')

%% Magnitude Only vs. Phase Only
G1 = complex(Fm, 0);
B1 = real(fftshift(ifft2(G1)));

G2 = 5E4*complex(cos(Fp), sin(Fp));
B2 = real(ifft2(G2));

figure(2)
subplot(1,2,1), imshow(B1/255)
title('Reconstruction - Magnitude Only')

subplot(1,2,2), imshow(B2/255)
title('Reconstruction - Phase Only')
