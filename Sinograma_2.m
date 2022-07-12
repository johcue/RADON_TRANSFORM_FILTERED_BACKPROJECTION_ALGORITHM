% clear all
% close all
% clc
% N = 501;            %Tamaño de la Imagen
% P = phantom([0.9, 0.7, 0.3, 0.2, 0.3, 0], N);  %Creamos una Matriz que simboliza la imagen en 2D
% paso=2;                   % Diferencia angular entre dos proyecciones consecutivas               
% theta= 0:paso:180-paso; %Conjunto de ángulos a obtener proyecciones
% [R,xp]=radon(P,theta);  %Cálculo del sinograma
% figure
% imagesc(theta,xp,R);%Visualización en mapa de colores
% title('Sinograma')
% figure
% imshow(P) %Visualización de la imagen original
% title('Imagen Original')

clear all
close all
clc
N=251;
P=phantom(N);
paso=0.5;
theta= 0:paso:180-paso; %Conjunto de ángulos a obtener proyecciones
[R,xp]= radon(P, theta);%Cálculo del sinograma
R_metros = R/251;  
figure
imagesc(theta,xp,R_metros);%Visualización en mapa de colores
title('Sinograma Original')
% figure
% imshow(P) %Visualización de la imagen original
% title('Imagen Original')

I=zeros(251); %Creamos una matriz de 251x251 de ceros
Io=1*10^(4); %Intensidad del Rayo Incidente
I=Io*exp(-R_metros); %Ley de Lambert-Beer
% figure
% imagesc(theta,xp, I);
% title('Sinograma de Transmision')
% colorbar
I_noisy = poissrnd(I);
figure
imagesc(theta,xp,I_noisy);
title('Sinograma con Ruido')
