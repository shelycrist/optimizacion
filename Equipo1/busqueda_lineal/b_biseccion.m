function alfa = b_biseccion(g, x, h, epsilon, maxiter)
% g: gradiente función objetivo
% x: punto inicial
% h: dirección de descenso
% epsilon: tolerancia para la convergencia
% maxiter: número máximo de iteraciones

% Inicialización
a    = 0;
b    = 1;
i    = 0;

while (b-a)>epsilon && i<=maxiter
    alfa=(a+b)/2;
    if g(x + alfa*h)'*h<0
        a=alfa;
    else
        b=alfa;
    end
    i = i + 1;
end
alfa = (a+b)/2;

end