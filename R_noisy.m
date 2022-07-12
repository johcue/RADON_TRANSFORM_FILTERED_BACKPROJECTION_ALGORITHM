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
Io=1*10^(4); %Intensidad del Rayo Incidente
I=Io*exp(-R_metros); %Ley de Lambert-Beer

I_noisy = poissrnd(I);
figure
imagesc(theta,xp, I_noisy);
title('Sinograma con Ruido 10^4')

R_4noisy=-log(I_noisy/Io);
figure
imagesc(theta,xp,R_4noisy);
title('Sinograma R_noisy 10^4')





