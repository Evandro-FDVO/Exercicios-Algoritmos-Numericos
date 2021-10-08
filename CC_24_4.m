% Exercício  CC-24.4 - Algoritmos Numéricos

% Desenvolvedores:  André Depra
%                   Evandro Falcão
%                   Rebeca Lube

% ------------------------------------------------------------------------------

% Evitar Bug
clc
clear all
close all
format long

% ------------------------------------------------------------------------------

% Dados iniciais
t = [0 10 20 30 35 40 45 50];% Vetor tempo;
c = [10 35 55 52 40 37 32 34];% Vetor c;
Q = 4;% Vazão;
l = length(t);
M = zeros(1,l);
 
% ------------------------------------------------------------------------------

% Integral númerica
% 3/8 de Simpson
j = 1;
for k=1:4:l
  M(j)=(3*(t(k+1)-t(k))/8)*(c(k)+3*c(k+1)+3*c(k+2)+c(k+3));
  j=j+1;
endfor

% Regra do Trapézio 
M(3)=(t(5)-t(4))*((c(4)+c(5))/2);

% ------------------------------------------------------------------------------

% Resposta
printf("O valor de quanta massa entra ou deixa um reator é aproximadamente: %f\n", sum(M)*Q);

% ------------------------------------------------------------------------------