clear all
close all
clc
N=251;
P=phantom(N);
paso=0.5;
theta= 0:paso:180-paso; %Conjunto de ángulos a obtener proyecciones
[R,xp]= radon(P, theta);%Cálculo del sinograma
R_metros = R/251;  
% subplot(2,2,1);
% imagesc(theta,xp,R_metros);
% title('Sinograma Original')

I=zeros(251); %Creamos una matriz de 251x251 de ceros
Io=1*10^(2); %Intensidad del Rayo Incidente
I=Io*exp(-R_metros); %Ley de Lambert-Beer

I_noisy = poissrnd(I);
figure
imagesc(theta,xp, I_noisy);
title('Sinograma con Ruido 10^2')

R_noisy=-log(I_noisy/Io);
figure
imagesc(theta,xp,R_noisy);
title('Sinograma R_noisy 10^2')

P_reconstruido=iradon(R_noisy, paso);
figure
imshow(P_reconstruido, [])
title('Reconstruccion 10^2')
