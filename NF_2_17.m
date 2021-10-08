% ------------------------------------------------------------------------------

% Exercício NF-2.17 - Algoritmos Numéricos

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
t =3;% Número de algarismos significativos;
m = -1;% Limite inferior expoente;
M = 2;% Limite superior expoente;
Nun = zeros(17,5);% Matriz conjunto de números possiveis;

% ------------------------------------------------------------------------------

% Cálculando os valores possiveis
for i = 1:17
  for j = 1:5
    Nun(1,j) = 0;
    Nun(1,1) = 1;
    Nun(1,5) = 1;
    
    if i<=9 && i>1
      Nun(i,1) = -1;
      
    endif
  endfor
endfor
Nun
% ------------------------------------------------------------------------------