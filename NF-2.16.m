% ------------------------------------------------------------------------------

% Exercício  NF-2.16 - Algoritmos Numéricos

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

% Dados
beta = 2;% Base;
t = 8;% Dígitos significativos;
m = 4;% Limite do expoente;
M = 4;% Limite do expoente;
x1_2 = [1 0 1 1 0 0 1 1];% Mantissa de x1 na base 2;
x2_2 = [1 0 1 1 0 0 1 0];% Mantissa de x2 na base 2;
x1_10 = 0;% x1 base 10;
x2_10 = 0;% x2 base 10;
e1 = 2^2;% Expoente na base 2 de x1;
e2 = 2^2;% Expoente na base 2 de x2;
l1 = length(x1_2);% Tamanho da vetor x1;
l2 = length(x2_2);% Tamanho da vetor x2;

% ------------------------------------------------------------------------------

% Multiplicando X pelo expoente
for i=1:l1
  x1_2(i) = x1_2(i)*2^(-i);
  x2_2(i) = x2_2(i)*2^(-i);
endfor

%Resposta
x1_10 = sum(x1_2')'*e1
x2_10 = sum(x2_2')'*e2

% ------------------------------------------------------------------------------