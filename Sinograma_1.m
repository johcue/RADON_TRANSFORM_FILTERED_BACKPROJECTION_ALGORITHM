X = zeros(128);      %Matriz de ceros de 128x128 que representa el fondo negro
X(10,10) = 1;        %El pixel en la posición (10,10) pintado de blanco
paso = 2;            %Diferencia angular entre dos proyecciones consecutivas
theta = 0:paso:360-paso;   %Conjunto de ángulos a obtener proyecciones
[R,xp] = radon(X,theta);   %Cálculo del sinograma
imagesc(theta,xp,R);          %Visualización en mapa de colores
