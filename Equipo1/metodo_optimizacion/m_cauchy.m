function [xk, alfa, hk, N] = m_cauchy(fun, grad, x0, h0, niter, epsilon, busq)

% Inicializacion
k        = 1;
xk(:, k) = x0;
hk(:, k) = h0;
alfa(k)  = 1;

% Para mantener un grado de eficiencia en la busqueda lineal con el menor
% gasto de tiempo y memoria se seleccion�
% - tol = 10^(-3)
% - maxiter = 1000
% para todos los m�todos
tol = 10^(-3); % precision del alfa a encontrar
maxiter = 100;     % m�ximo numero de iteraciones para que sea eficiente

% Pare el m�todo de Wolfe se sigue la referencia de Libro de Nocedal y se hace
c1      = 0.0001;
c2      = 0.9;

while norm(grad(xk(:,k)))>epsilon && k<niter
    % Calcular el tama�o de paso usando una busqueda lineal.
	% Si busq =
    % 			1. Busqueda por el m�todo de biseccion
	% 			2. Busqueda por el m�todo de la secci�n aurea
	% 			3. Busqueda por el m�todo de Wolfe
	if busq == 1 % Busqueda lineal por bisecci�n
		alfa(k+1) = b_biseccion(grad, xk(:, k), hk(:, k), tol, maxiter);
	elseif busq == 2 % Busqueda linear por la secci�n a�rea
		alfa(k+1) = b_dorada(fun, xk(:,k), hk(:,k), tol, maxiter);
	else
	    alfa(k+1) = b_wolfe(fun, grad, xk(:,k), hk(:,k), c1, c2, maxiter);
    end
    % Actualizar contador de kaciones
    k = k + 1;
    % Actualizar el punto
    xk(:,k) = xk(:,k-1) + alfa(k)*hk(:,k-1);
    % Actualizar la direcci�n de descenso
    hk(:,k)=-grad(xk(:,k));
end
N = k;
end