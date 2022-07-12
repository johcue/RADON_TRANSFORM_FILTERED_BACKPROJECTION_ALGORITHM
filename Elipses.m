clear all
close all
clc
N = 501;            %Tama�o de la Imagen
P = phantom([1, 0.7, 0.2, 0.2, 0.3, 0], N);  %Creamos una Matriz que simboliza la imagen en 2D
paso=2;                   % Diferencia angular entre dos proyecciones consecutivas               
theta= 0:paso:180-paso; %Conjunto de �ngulos a obtener proyecciones
[R,xp]=radon(P,theta);  %C�lculo del sinograma
subplot(2,2,1);
imshow(P) %Visualizaci�n de la imagen original
title('Imagen Original')
subplot(2,2,2);
imagesc(theta,xp,R);%Visualizaci�n en mapa de colores
title('Sinograma')