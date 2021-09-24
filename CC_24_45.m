% ------------------------------------------------------------------------------

% Exercício  CC-24.45 - Algoritmos Numéricos

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
t = 0:0.1:30;
l = length(t);
v = zeros(1,l);
delta_s = zeros(1,l);

% Velocidades
for i=1:l
  if 1<=i && i<=101
    v(i) = 11*(t(i)^2)-5*t(i);
  endif
  if 100<i && i<=201
    v(i) = 1100-5*t(i);
  endif
  if 201<i && i<=301
    v(i) = 50*t(i)+2*((t(i)-20)^2);
  endif
endfor

% ------------------------------------------------------------------------------

% 3/8 de Simpson
j = 1;
for k=1:4:l
  if k<=l-1
    delta_s(j)=(3*0.1/8)*(v(k)+3*v(k+1)+3*v(k+2)+v(k+3));
    j=j+1;
  endif
endfor

% Regra do Trapézio 
for k=4:4:l
  delta_s(j)=(0.1)*((v(k)+v(k+1))/2);
  j=j+1;
endfor

printf("O valor da distância percorrida é aproximadamente: %f\n", sum(delta_s));

% ------------------------------------------------------------------------------