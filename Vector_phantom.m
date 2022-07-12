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
figure
imshow(P) %Visualización de la imagen original
title('Imagen Original')



% close all
% clear all
% clc
% for N=[101 201 501 1001]
% figure(N) 
% P = phantom(N);
% imshow(P)
% end
% 
% X = zeros(130);          %Matriz de ceros de 130x130 que representa el fondo negro
% X(5,5) = 1;              %El pixel en la posición (5,5) pintado de blanco
% paso = 5;                %Diferencia angular entre dos proyecciones consecutivas
% theta = 0:paso:170-paso; %Conjunto de ángulos a obtener proyecciones
% [R,xp] = radon(X,theta); %Cálculo del sinograma
% imagesc(theta,xp,R);     %Visualización en mapa de colores
% cosd()
% sind()
% sind()

