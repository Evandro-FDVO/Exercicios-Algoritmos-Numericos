% ------------------------------------------------------------------------------

% Exercício  CC-20.49 - Algoritmos Numéricos

% Desenvolvedores:  André Depra
%                   Evandro Falcão
%                   Rebeca Lube

% ------------------------------------------------------------------------------

% Evitar Bug
clc
clear all
close all

% ------------------------------------------------------------------------------

g = [9.81 9.7487 9.6879 9.6278 9.5682];% Vetor gravidade;
y = [0 30000 60000 90000 120000];% Vetor altura;
n = length(g);% Número de pontos;

% ------------------------------------------------------------------------------

% Operações básicas para a linearização
g_y = g .* y;%g x y;
y_2 = y.^2;% y^2;
  
soma_g = sum(g);% Somatória g;
soma_y = sum(y);% Somatória y;
soma_g_y = sum(g_y);% Somatória g x y;
soma_y_2 = sum(y_2);% Somatória (y)^2;

media_g = soma_g/n;% Média da somatória g;
media_y = soma_y/n;% Média da somatória y;

% Modelo 1 grau
a1 = ((n*(soma_g_y)-(soma_g*soma_y))/(n*(soma_y_2)-(soma_y)^2));
a0 = media_g-a1*media_y;

% ------------------------------------------------------------------------------

% Resposta
printf("O valor de a0 é: %f\n", a0);
printf("O valor de a1 é: %f\n", a1);
printf("O valor de g (y=55000m) é: %f\n", a0+a1*55000);

% ------------------------------------------------------------------------------