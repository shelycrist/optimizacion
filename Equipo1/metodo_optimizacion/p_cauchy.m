clc;
disp('Método de Cauchy para la busqueda del mínimo de la funcón ');
fprintf('f(x, y) %s en R^2\n ',fe);

disp(' ');
disp('La tolerancia para el método fue fijada previamente en ');
disp(['epsilon = ',num2str(epsilon)]);
disp(' ');
disp('Entre el número máximo de iteraciones para el método ');
niter = input('niter = ');
disp(' ');
disp('Selecciones el tipo de busqueda lineal para el método de Cauchy ')
disp('1. Busqueda por el método de biseccion ');
disp('2. Busqueda por el método de la sección aurea ');
disp('3. Busqueda por el método de Wolfe ');
busqueda = input('Busqueda = ');
disp(' ');
% Llamamos a la función que realiza el método de Cauchy
[xk, alfa, hk, N] = m_cauchy(f, g, x0, -g(x0), niter, epsilon, busqueda);

if N == niter
		disp('El método alcanzo el número máximo de iteraciones sin convergencia ');
		disp('a un punto aproximado de una solución del problema de minimización');
end
disp("Iteracion         (xk)'             alfa                  (hk)'     ");
disp("--------------------------------------------------------------------");
for i=1:N
	fprintf('%4.0f\t [%8.5f %8.5f]\t %8.5f\t [%8.5f %8.5f]\n',i,xk(1,i),xk(2,i),alfa(i),xk(1,i),xk(2,i));
end
disp(' ')
fprintf('El punto óptimo es: [%8.5f %8.5f]\n',xk(1,N),xk(2,N))
fprintf('El valor óptimo es: %8.5f\n',f(xk(:,N)))
disp(' ');

grafica;

disp(' ');
pause(5);
while true
	continuar=input('Pulsa la tecla Enter para continuar: ');
	break
end