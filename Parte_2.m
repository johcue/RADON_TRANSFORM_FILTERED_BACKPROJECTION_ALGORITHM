N=256;
P=phantom(N);
paso=0.5;
theta= 0:paso:180-paso; %Conjunto de ángulos a obtener proyecciones
[R,xp]= radon(P, theta);%Cálculo del sinograma 
figure
imagesc(theta,xp,R);%Visualización en mapa de colores
title('Sinograma Wow')
figure
imshow(P);%Visualización en mapa de colores

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Filas de la matriz R. El eje x' tiene valores positivos y negativos y nosotros los tenemos almacenados en la variable "xp".
% %Tiene que ser igual a lo que este almamcenado en xp                
Columna_R = 1:length(theta);
fila_R=round((10*cosd(theta(Columna_R)))+20*sind(theta(Columna_R)))+184;
%Para F(10,20)
f = zeros(256); %Primero creamos la matriz con valores iguales a ceros
for Columna_R = 1:length(theta) %Cantidad de ángulos capturados
fila_R=round((10*cosd(theta(Columna_R)))+20*sind(theta(Columna_R)))+184; %Escriba acá f(20,10) = f(20,10) + R(fila_R,Columna_R); %Observe que el valor de "y" es la fila end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Reorganiizzando las coordenadas X;Y de la imagen
ancho = 256;
alto = 256;
x = j - ancho/2; %Aquí j es la coordenada horizontal de la imagen para Matlab
y = -i + alto/2; %Aquí i es la coordenada vertical de la imagen para Matlab
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f = zeros(256); %Primero creamos la matriz con valores iguales a ceros
ancho = 256;
alto = 256;

for i = 1:256 %Para recorrer las filas
  for j = 1:256 %Para recorrer las columnas
     x = j - ancho/2; %Aquí j es la coordenada horizontal de la imagen para Matlab
     y = -i + alto/2; %Aquí i es la coordenada vertical de la imagen para Matlab
     for Columna_R = 1:length(theta) %Cantidad de ángulos capturados
          fila_R=(round(x*cosd(theta(Columna_R))+y*sind(theta(Columna_R))))+184; %Escriba f(i,j) = f(i,j) + R(fila_R,Columna_R); %Observe que el valor de "y" es la fila end
    end
end
%Para visualizar el resultado
subplot(2,2,1);
imshow(P)
title('Imagen Original')
subplot(2,2,2);
imshow(f,[])
title('Imagen Recreada')