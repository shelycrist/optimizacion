% Métodos de optimización sin restriciones para el problema de busqueda del
% mínimo de una función f:R^2->R a partir de un punto inicial x0
% Con f al menos de clase C1%
%
% Autores:
% Oswaldo Yánez C.I: 26.238.049
% Shely Zencoff C.I: 25.856.358 
% Xiangn Rodríguez C.I: 24.160.257
% José Jiménez C.I: 25.753.840
%

% Guión Principal

% Limpiamos el valor de todas las variables creadas anteriormente para evitar
% conflictos o errores
clear all;
% Cerramos cualquier grafica creada anteriormente
close all;
% Limpiamos la pantalla
clc;

% Añadimos las carpetas de las funciones a utilizar a la ruta de trabajo.
addpath(pwd);

cd busqueda_lineal/;
addpath(genpath(pwd));
cd ..;

cd metodo_optimizacion/;
addpath(genpath(pwd));
cd ..;

% Imprimimos la informacion del guión o script
disp('METODOS DE OPTIMIZACION SIN RESTRICCIONES PARA EL PROBLEMA');
disp('MINIMIZAR F(X) CON X EN R^2');

% Solicitar la función de entrada en dos variables por pantalla
disp(' ');
disp('FUNCION A MINIMIZAR');
disp("------------------------------------------------------------");
disp('Ingrese la función a minimizar en los argumento x,y en sintaxis de Matlab')
disp('por ejemplo: f(x, y)= 3*x^2 -(x*y)/2 + y^2')
disp(' ')
fe = input('f(x, y)= ', 's');


% Solicitar el punto inicial
disp(' ');
disp('Ingrese el punto inical en la forma [xi yi]');
xi = input('Punto inicial x0 = ');
x0=xi';
disp(' ');

% Convertimos la funcion entrada fe a funcion simbolica fs
% para calcular las derivadas
syms x y
fs = str2sym(fe);

% Primeras derivadas parciales de f
fxs=diff(fs,x);
fys=diff(fs,y);

% segundas derivadas parciales de f
fxxs=diff(fs,x,2);
fxys=diff(fs,x,y);
fyxs=diff(fs,y,x);
fyys=diff(fs,y,2);

% Transformamos los argumentos de la funcion de entrada de (x,y) a (x(1),x(2))
sa=replace(fe,'x','x(1)');
sb=replace(sa,'y','x(2)');
f=str2func(['@(x) ' sb]);

% Transformamos los argumentos de las derivadas paraciales de (x,y) a (x(1),x(2))
sa=replace(char(fxs),'x','x(1)');
sb=replace(sa,'y','x(2)');
fx=str2func(['@(x) ' sb]);

sa=replace(char(fys),'x','x(1)');
sb=replace(sa,'y','x(2)');
fy=str2func(['@(x) ' sb]);

sa=replace(char(fxxs),'x','x(1)');
sb=replace(sa,'y','x(2)');
fxx=str2func(['@(x) ' sb]);

sa=replace(char(fxys),'x','x(1)');
sb=replace(sa,'y','x(2)');
fxy=str2func(['@(x) ' sb]);

sa=replace(char(fyxs),'x','x(1)');
sb=replace(sa,'y','x(2)');
fyx=str2func(['@(x) ' sb]);

sa=replace(char(fyys),'x','x(1)');
sb=replace(sa,'y','x(2)');
fyy=str2func(['@(x) ' sb]);

% definimos la funciones gradiente g y hessiana H de f
g = @(x) [fx(x); fy(x)];
H = @(x) [fxx(x) fyx(x); fxy(x) fyy(x)];


% % Niveles para las lineas de contorno
% niveles=[0.1,0.1,0.5,0.5,1,1,5,5,10,10,15,15,20,20,25,25,30,30,40,40,50,50,60,60];
% fcontour(fs,[ax bx cy dy],'LevelList',niveles);
% grid
% hold on
% xk(:,1)=x0;
% plot(xk(1,1),xk(2,1),'ro')

% Limpiamos las variables symbolicas usadas
% symObj = syms;
% cellfun(@clear,symObj);

% Creamos el menu principal e ingresamos una opcion
% clc;

% Se fija la tolerancia igual para todos los métodos;
epsilon = 0.0001;

while true
    disp('Métodos de minimización disponibles');
    disp("------------------------------------------------------------");
    disp('1. Método de Cauchy');
    disp('2. Método de Newton (puro)');
    disp('3. Métodos cuasi Newton');
    disp('4. Salir');
    opcion = input('Por favor, elige una opcion: ');
    
    switch opcion
        case 1
			disp(' ');
            disp('Has seleccionado: Método de Cauchy');
            pause(2);
            p_cauchy;
            disp('Regresando al menu de Metodos de minimización');
			disp(' ');
			pause(2);
        case 2
		disp(' ');
            disp('Has seleccionado: Método de Newton (puro)');
            pause(2);
            p_newton;
            disp('Regresando al menu de Metodos de minimización');
			disp(' ');
			pause(2);
			%clc;
        case 3
		disp(' ');
            disp('Has seleccionado: Método de cuasi Newton');
            pause(2);
            p_qnewton;
            disp('Regresando al menu de Metodos de minimización');
			disp(' ');
			pause(2);
			%clc;
        case 4
			disp(' ');
            disp('Has decidido: Salir');
            disp('Chao!');
            break;
        otherwise
            disp('Opcion no valida. Por favor, intenta de nuevo');
    end
end


