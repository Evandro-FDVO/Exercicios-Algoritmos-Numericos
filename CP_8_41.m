% ------------------------------------------------------------------------------

% Exerc�cio  CP-8.41 - Algoritmos Num�ricos

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

n = 18;% N�mero de itera��es

x1 = zeros(1,n);% Vetor x1;
x2 = zeros(1,n);% Vetor x2;
x3 = zeros(1,n);% Vetor x3;

x1(1,1) = 200;% Chute inicial;
x2(1,1) = 450;% Chute inicial;
x3(1,1) = 100;% Chute inicial;

% ------------------------------------------------------------------------------

J = zeros(3,3);% Matriz Jacobianos;

for i = 2:1:n
  f1 = ((10^-9)*(((450+273)^4)-(x2(1,i-1)+273)^4))-x1(1,i-1);% Fun��o 1 (n-1);
  f2 = 4*(x2(1,i-1)-x3(1,i-1))-x1(1,i-1);% Fun��o 2 (n-1);
  f3 = ((1.3*(x3(1,i-1)-25)^(4/3))-x1(1,i-1));% Fun��o 3 (n-1);
  
  der_f1x1 = -1;% Derivada da fun��o 1 em rela��o a x1;
  der_f1x2 = (10^-9)*((-4*(x2(1,i-1)^3))-(3276*(x2(1,i-1)^2))-(894348*x2(1,i-1))-81385668);% Derivada da fun��o 1 em rela��o a x2;
  der_f1x3 = (10^-9)*((4*(x3(1,i-1)^3))+(3276*(x3(1,i-1)^2))+(894348*x3(1,i-1))+81385668);% Derivada da fun��o 1 em rela��o a x3;

  der_f2x1 = -1;% Derivada da fun��o 2 em rela��o a x1;
  der_f2x2 = 4;% Derivada da fun��o 2 em rela��o a x2;
  der_f2x3 = -4;% Derivada da fun��o 2 em rela��o a x3;

  der_f3x1 = -1;% Derivada da fun��o 3 em rela��o a x1;
  der_f3x2 = 0;% Derivada da fun��o 3 em rela��o a x2;
  der_f3x3 = 1.3*(4*(x3(1,i-1)-25)^(1/3))/3;% Derivada da fun��o 3 em rela��o a x3;
  
  J = [der_f1x1 der_f1x2 der_f1x3; der_f2x1 der_f2x2 der_f2x3; der_f3x1 der_f3x2 der_f3x3];% Matriz Jacobianos;
  J =inv(J);
  
  x1(1,i) =  x1(1,i-1)-((J(1,1)*f1)+(J(1,2)*f2)+(J(1,3)*f3));% M�todo de Newton Raphson;
  x2(1,i) =  x2(1,i-1)-((J(2,1)*f1)+(J(2,2)*f2)+(J(2,3)*f3));% M�todo de Newton Raphson;
  x3(1,i) =  x3(1,i-1)-((J(3,1)*f1)+(J(3,2)*f2)+(J(3,3)*f3));% M�todo de Newton Raphson;
endfor

printf("O valor de q(x1) �: %f\n", x1(1,n))
printf("O valor de T1(x2) �: %f\n", x2(1,n))
printf("O valor de T2(x3) �: %f\n", x3(1,n))

% ------------------------------------------------------------------------------