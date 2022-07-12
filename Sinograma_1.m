X = zeros(128);      %Matriz de ceros de 128x128 que representa el fondo negro
X(10,10) = 1;        %El pixel en la posici�n (10,10) pintado de blanco
paso = 2;            %Diferencia angular entre dos proyecciones consecutivas
theta = 0:paso:360-paso;   %Conjunto de �ngulos a obtener proyecciones
[R,xp] = radon(X,theta);   %C�lculo del sinograma
imagesc(theta,xp,R);          %Visualizaci�n en mapa de colores
