% ------------------------------------------------------------------------------

% Exerc�cio  CC-20.41 - Algoritmos Num�ricos

% Desenvolvedores:  Andr� Depra
%                   Evandro Falc�o
%                   Rebeca Lube

% ------------------------------------------------------------------------------

% Evitar Bug
clc
clear all
close all

% ------------------------------------------------------------------------------

t = [5 10 15 20];% Vetor tempo;
p = [200 450 950 2000];% Vetor popula��o;
n = length(t);% N�mero de pontos;

% ------------------------------------------------------------------------------

% Lineariza��o

t_lin = 1./t;% 1/t;
p_lin = 1./p;% 1/p;

t_lin_p_lin = t_lin .* p_lin;% t_lin x p_lin;
p_lin_2 = p_lin.^2;% p_lin^2;
  
soma_t_lin = sum(t_lin);% Somat�ria 1/t;
soma_p_lin = sum(p_lin);% Somat�ria 1/p;
soma_t_lin_p_lin = sum(t_lin_p_lin);% Somat�ria 1/t*1/p;
soma_p_lin_2 = sum(p_lin_2);% Somat�ria (1/p)^2;

media_t_lin = soma_t_lin/n;% M�dia da somat�ria 1/t;
media_p_lin = soma_p_lin/n;% M�dia da somat�ria 1/p;

% Modelo Exponencial

a0 = ((n*(soma_t_lin_p_lin)-(soma_t_lin*soma_p_lin))/(n*(soma_p_lin_2)-(soma_p_lin)^2));

a1 = media_t_lin-a0*media_p_lin;

alfa = 1/a1;
beta = a0*alfa;

% ------------------------------------------------------------------------------

printf("O valor de alfa �: %f\n", alfa);
printf("O valor de berta �: %f\n", beta);

% ------------------------------------------------------------------------------