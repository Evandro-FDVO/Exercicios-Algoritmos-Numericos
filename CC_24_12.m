% Exercício  CC-24.12 - Algoritmos Numéricos

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
t = [0 1 2 3 4 8 10 15 20 24];% Vetor tempo;
fluxo = [15 14 12 11 9 8 5 2.5 2 1];% Vetor Fluxo;
h = 24;% Tempo após aplicação [horas];
A = 12;% Área de aplicação [cm^2];
l = length(t);
Q = zeros(1,l);% Quantidade de droga absorvida;
 
% ------------------------------------------------------------------------------

% Integral númerica
% 3/8 de Simpson
j = 1;
for k=1:4:4
  Q(j)=(3*(t(k+1)-t(k))/8)*(fluxo(k)+3*fluxo(k+1)+3*fluxo(k+2)+fluxo(k+3));
  j=j+1;
endfor

% Regra do Trapézio 
for k=5:2:l-1
  Q(j)=(t(k+1)-t(k))*((fluxo(k)+fluxo(k+1))/2);
  j=j+1;
endfor

Q(5)=(t(5)-t(4))*((fluxo(4)+fluxo(5))/2);
Q(6)=(t(7)-t(6))*((fluxo(6)+fluxo(7))/2);
Q(7)=(t(9)-t(8))*((fluxo(8)+fluxo(9))/2);

% ------------------------------------------------------------------------------

% Resposta
printf("A quantidade de droga injetada é aproximadamente: %f\n", sum(Q)*h*A);

% ------------------------------------------------------------------------------