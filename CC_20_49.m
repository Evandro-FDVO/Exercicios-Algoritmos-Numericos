% ------------------------------------------------------------------------------

% Exerc�cio  CC-20.49 - Algoritmos Num�ricos

% Desenvolvedores:  Andr� Depra
%                   Evandro Falc�o
%                   Rebeca Lube

% ------------------------------------------------------------------------------

% Evitar Bug
clc
clear all
close all

% ------------------------------------------------------------------------------

g = [9.81 9.7487 9.6879 9.6278 9.5682];% Vetor gravidade;
y = [0 30000 60000 90000 120000];% Vetor altura;
n = length(g);% N�mero de pontos;

% ------------------------------------------------------------------------------

% Opera��es b�sicas para a lineariza��o
g_y = g .* y;%g x y;
y_2 = y.^2;% y^2;
  
soma_g = sum(g);% Somat�ria g;
soma_y = sum(y);% Somat�ria y;
soma_g_y = sum(g_y);% Somat�ria g x y;
soma_y_2 = sum(y_2);% Somat�ria (y)^2;

media_g = soma_g/n;% M�dia da somat�ria g;
media_y = soma_y/n;% M�dia da somat�ria y;

% Modelo 1 grau
a1 = ((n*(soma_g_y)-(soma_g*soma_y))/(n*(soma_y_2)-(soma_y)^2));
a0 = media_g-a1*media_y;

% ------------------------------------------------------------------------------

% Resposta
printf("O valor de a0 �: %f\n", a0);
printf("O valor de a1 �: %f\n", a1);
printf("O valor de g (y=55000m) �: %f\n", a0+a1*55000);

% ------------------------------------------------------------------------------