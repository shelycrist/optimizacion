function [xk, alfa, hk, N] = m_qnewton(fun, grad, x0, niter, epsilon, metodo)

% Inicializacion
k        = 1;
xk(:, k) = x0;
gk       = grad(xk(:,k));
Hk       = eye(length(x0));
alfa(k)  = 1;

% Pare el método de Wolfe se sigue la referencia de Libro de Nocedal y se hace
maxiter = 100;     % máximo numero de iteraciones
c1      = 0.0001;
c2      = 0.9;


while norm(gk)>epsilon && k<niter
	hk(:, k) = -Hk*gk;
	alfa(k+1) = b_wolfe(fun, grad, xk(:,k), hk(:,k), c1, c2, maxiter);
    xk(:,k+1) = xk(:,k) + alfa(k+1)*hk(:, k);
	sk = xk(:,k+1) - xk(:,k);
	yk = grad(xk(:,k+1)) - grad(xk(:,k));
	if metodo==1 % DFP
		Hk = Hk + + (sk*sk')/(yk'*sk) - (Hk*(yk)*yk'*Hk)/(yk'*Hk*yk);
	elseif metodo==2 % BFGS
		Hk = Hk + (1+(yk'*Hk*yk)/(sk'*yk))*(sk*sk')/(sk'*yk) - (sk*yk'*Hk+Hk*yk*sk')/(sk'*yk);
	else
		Hk = eye(length(x0));
	end 
	gk = grad(xk(:,k+1));
	k = k + 1;
end
N = k;
end