clc; clear;

%%% proses merubah warna YIQ ke RGB (Red, Green dan Blue)

%%% created by: Arif Mudi Priyatno 
%%% https://github.com/arifmudi

%% load gambar 
load YIQ.mat
Y = YIQ(:,:,1);
I = YIQ(:,:,2);
Q = YIQ(:,:,3);

%% merubah uint8 ke double
Y = double(Y);
I = double(I);
Q = double(Q);

%% konversi 0-22 menjadi 0-1
if max(max(Y)) > 1.0 || max(max(I)) > 1.0 || max(max(Q)) > 1.0
   Y = Y / 255;
   I = I / 255;
   Q = Q /255;
end

[tinggi, lebar] = size(Y);
for m=1:tinggi
    for n=1: lebar
        R(m,n) = Y(m,n) + 0.956 * I(m,n) + 0.621 * Q(m,n);
        G(m,n) = Y(m,n) - 0.272 * I(m,n) + 0.647 * Q(m,n);
        B(m,n) = Y(m,n) - 1.106 * I(m,n) + 1.703 * Q(m,n);
    end
end

%% merubah 0-1 menjadi 0-255
R = R * 255;
G = G * 255;
B = B * 255;

%% merubah double manjdai uint8
R = uint8(R);
G = uint8(G);
B = uint8(B);

%% menyatukan 3 channel warna 
RGB = cat(3,R,G,B);