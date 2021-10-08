% Exerc�cio  CC-28.33 - Algoritmos Num�ricos

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

% Dados iniciais
Ta = 20;% Temperatura do meio circundante;
T0 = 90;% Temperatura inicial da esfera;
k = 0.25;% Constante de porporcionalidade;
h = 0.5;% Passo;
n = 10;% N�mero de itera��es;
t = zeros(1,n);% Vetor tempo;

j=0;
for i = 1:n
  t(i) = j;
  j=j+h;
endfor

% ------------------------------------------------------------------------------

% M�todo de Runge-Kutta de 4� ordem
for x = 1:n
  k1 = -k*(T0-Ta);% Atribuindo valores a k1;
  k2 = -k*((T0+(k1*h/2))-(Ta+(h/2)));% Atribuindo valores a k2;
  k3 = -k*((T0+(k2*h/2))-(Ta+(h/2)));% Atribuindo valores a k3;
  k4 = -k*((T0+(k3*h))-(Ta+h));% Atribuindo valores a k4;
  T0 = T0+((h/6)*(k1+2*k2+2*k3+k4));
endfor

% ------------------------------------------------------------------------------

% Resposta
printf("Temperatura final � aproximadamente: %f\n", T0);
printf("Tempo decorrido � aproximadamente: %f min\n", t(n));

% ------------------------------------------------------------------------------