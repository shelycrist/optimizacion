% Solicitar el dominio inicial para la grafica de la función
disp('Ingrese los limites del dominio [ax, bx] x [cy, dy] de la función para la gráfica de la misma ');
domx = input('Dominio en X [a, b] = ');
domy = input('Dominio en Y [c, d] = ');
ax=domx(1); bx=domx(2);
cy=domy(1); dy=domy(2);

% Graficamos la superficie en 3D de la funcion f(x,y)
f1 = figure('Name','Superficie','NumberTitle','off');
fsurf(fs,[ax bx cy dy],'ShowContours','on','HandleVisibility','off');
hold on;
plot3(1,1,f([1;1]),'mo','DisplayName','Punto inicial');
for i=2:N-2
	plot3(xk(1,i),xk(2,i),f(xk(:,i)),'r*','HandleVisibility','off');
end
plot3(xk(1,N-1),xk(2,N-1),f(xk(:,N-1)),'r*','DisplayName','iterados'); %Para generar las leyendas de los iterados
plot3(xk(1,N),xk(2,N),f(xk(:,N)),'bpentagram','DisplayName','punto óptimo');
title(strcat('f(x,y)=',fe))
xlabel('x');
ylabel('y');
zlabel('z');
legend;
hold off;

% Graficamos las curvas de nivel correspondientes a los puntos xk
f2 = figure('Name','Conjuntos de nivel','NumberTitle','off');
fcontour(fs,[ax bx cy dy],'HandleVisibility','off');
hold on;
plot(1,1,'mo','DisplayName','Punto inicial');
xlabel('x');
ylabel('y');
for i=2:N-2
	plot(xk(1,i),xk(2,i),'r*','HandleVisibility','off');
end
plot(xk(1,N-1),xk(2,N-1),'r*','DisplayName','iterados'); %Para generar las leyendas de los iterados
plot(xk(1,N),xk(2,N),'bpentagram','DisplayName','punto óptimo');
legend;
hold off;
