function [xk, alfa, hk, N] = m_newton(grad, Hess, x0, niter, epsilon)

% Inicializacion
k        = 1;
xk(:, k) = x0;
alfa(k)  = 1; % para mantener compatibilidad con la salida

while norm(grad(xk(:,k)))>epsilon && k<=niter
	gk = grad(xk(:,k));
	Hk = Hess(xk(:,k));
    hk(:,k) = -Hk\gk;
	xk(:,k+1) = xk(:,k) + alfa(k)*hk(:,k);
	alfa(k+1)  = 1; % para mantener compatibilidad con la salida
	k = k + 1;
end
N = k;
end
