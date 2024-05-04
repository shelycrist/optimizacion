clc;
disp('M�todo de Newton para la busqueda del m�nimo de la func�n ');
fprintf('f(x, y) %s en R^2\n ',fe);

disp(' ');
disp('La tolerancia para el m�todo fue fijada previamente en ');
disp(['epsilon = ',num2str(epsilon)]);
disp(' ');
disp('Entre el n�mero m�ximo de iteraciones para el m�todo ');
niter = input('niter = ');
disp(' ');

% Llamamos a la funci�n que realiza el m�todo de Newton
[xk, alfa, hk, N] = m_newton(g, H, x0, niter, epsilon);

if N == niter
		disp('El m�todo alcanzo el n�mero m�ximo de iteraciones sin convergencia ');
		disp('a un punto aproximado de una soluci�n del problema de minimizaci�n');
end
disp("Iteracion         (xk)'             alfa                  (hk)'     ");
disp("--------------------------------------------------------------------");
for i=1:N
	fprintf('%4.0f\t [%8.5f %8.5f]\t %8.5f\t [%8.5f %8.5f]\n',i,xk(1,i),xk(2,i),alfa(i),xk(1,i),xk(2,i));
end
disp(' ')
fprintf('El punto �ptimo es: [%8.5f %8.5f]\n',xk(1,N),xk(2,N))
fprintf('El valor �ptimo es: %8.5f\n',f(xk(:,N)))
disp(' ');

grafica;

disp(' ');
pause(5);
while true
	continuar=input('Pulsa la tecla Enter para continuar: ');
	break
end
