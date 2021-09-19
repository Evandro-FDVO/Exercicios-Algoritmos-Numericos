% ------------------------------------------------------------------------------

% Exerc�cio  CP-8.42 - Algoritmos Num�ricos

% Desenvolvedores:  Andr� Depra
%                   Evandro Falc�o
%                   Rebeca Lube

% ------------------------------------------------------------------------------

% Evitar Bug
clc
clear all
close all
format long

% ------------------------------------------------------------------------------

% Valores iniciais

n = 10;% N�mero de itera��es

x1 = zeros(1,n);% Vetor x1 (sigma 1);
x2 = zeros(1,n);% Vetor x2 (sigma 2);
x3 = zeros(1,n);% Vetor x3 (sigma 3);

x1(1,1) = -200;% Chute inicial;
x2(1,1) = 1;% Chute inicial;
x3(1,1) = 200;% Chute inicial;

% ------------------------------------------------------------------------------

for i = 2:1:n
  f1 = (x1(1,i-1)^3)-(33*x1(1,i-1)^2)-(704*x1(1,i-1))-1859;% Fun��o para o chute 1;
  f2 = (x2(1,i-1)^3)-(33*x2(1,i-1)^2)-(704*x2(1,i-1))-1859;% Fun��o para o chute 2;
  f3 = (x3(1,i-1)^3)-(33*x3(1,i-1)^2)-(704*x3(1,i-1))-1859;% Fun��o para o chute 3;
  
  der_f1x1 = (3*x1(1,i-1)^2)-(66*x1(1,i-1))-704;% Derivada da fun��o 1 para o chute 1;
  der_f1x2 = (3*x2(1,i-1)^2)-(66*x2(1,i-1))-704;% Derivada da fun��o 1 para o chute 2;
  der_f1x3 = (3*x3(1,i-1)^2)-(66*x3(1,i-1))-704;% Derivada da fun��o 1 para o chute 3;
  
  x1(1,i) =  x1(1,i-1)-(f1/der_f1x1);% M�todo de Newton Raphson;
  x2(1,i) =  x2(1,i-1)-(f2/der_f1x2);% M�todo de Newton Raphson;
  x3(1,i) =  x3(1,i-1)-(f3/der_f1x3);% M�todo de Newton Raphson;
endfor

printf("O valor de sigma 1(x1) �: %f\n", x1(1,n))
printf("O valor de sigma 2(x2) �: %f\n", x2(1,n))
printf("O valor de sigma 3(x3) �: %f\n", x3(1,n))

% ------------------------------------------------------------------------------