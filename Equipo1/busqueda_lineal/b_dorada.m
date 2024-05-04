function alfa = b_dorada(f, x, h, epsilon, maxiter)
% f: funci�n objetivo
% x: punto inicial
% h: direcci�n de descenso
% epsilon: tolerancia para la convergencia
% maxiter: n�mero m�ximo de iteraciones

% Inicializaci�n
a    = 0;
b    = 1;
i    = 0;

while abs(b-a)>epsilon && i<=maxiter
    alpha1=a+0.618*(b-a);
    alpha2=b-0.618*(b-a);
    if f(x+alpha1*h)<f(x+alpha2*h)
        a=alpha2;
    elseif f(x+alpha1*h)>f(x+alpha2*h)
        b=alpha1;
    else
        a=alpha2;
        b=alpha1;
    end
    i = i + 1;
end
alfa = (alpha1+alpha2)/2;
end