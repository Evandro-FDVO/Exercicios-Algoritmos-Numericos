% ------------------------------------------------------------------------------

% Exercício  CC-20.2 - Algoritmos Numéricos

% Desenvolvedores:  André Depra
%                   Evandro Falcão
%                   Rebeca Lube

% ------------------------------------------------------------------------------

% Evitar Bug
clc
clear all
close all

% ------------------------------------------------------------------------------

T = [-50 -30 0 60 90 110];% Vetor temperatura;
c = [1270 1280 1350 1480 1580 1700];% Vetor c;
n = length(T);% Número de pontos;

% ------------------------------------------------------------------------------

% Linearização
T_c = T .* c;%T x c;
T_2 = T.^2;% T^2;
  
soma_T = sum(T);% Somatória T;
soma_c = sum(c);% Somatória c;
soma_T_c = sum(T_c);% Somatória T x c;
soma_T_2 = sum(T_2);% Somatória (T)^2;

media_T = soma_T/n;% Média da somatória T;
media_c = soma_c/n;% Média da somatória c;

% Modelo 1 grau

a0 = ((n*(soma_T_c)-(soma_T*soma_c))/(n*(soma_T_2)-(soma_T)^2));
a1 = media_c-a0*media_T;

% ------------------------------------------------------------------------------

printf("O valor de a0 é: %f\n", a0);
printf("O valor de a1 é: %f\n", a1);

% ------------------------------------------------------------------------------