function alfa = b_wolfe(f, g, x, h, c1, c2, maxiter)
% f: función objetivo
% g: gradiente función objetivo
% x: punto inicial
% h: dirección de descenso
% c1: parametro de Armijo
%    tipico c1 en [10^-5, 10^-1]
% c2: parametro de Wolfe
%    tipico c2 en [0.1, 0.9]
% maxiter: número máximo de iteraciones

% Inicializacion parametros de busqueda
theta = @(alfa,x,h) f(x+alfa*h);
a = 0;
b = inf;
alfa = 1;
i = 1;
while i<=maxiter
    t1 = theta(alfa,x,h);
    t2 = f(x)+alfa*c1*g(x)'*h;
    gd1 = g(x+alfa*h);
    gd2 = g(x);
    w1 = gd1'*h;
    w2 = c2*gd2'*h;
    if t1 > t2
        b = alfa;
        alfa = (a+b)/2;
    elseif w1 < w2
        a = alfa;
        if b == inf
            alfa = 2*a;
        else
            alfa = (a + b)/2;
        end
    else
        break
    end
    i = i + 1;
end
end