% ------------------------------------------------------------------------------

% Exerc�cio NF-2.17 - Algoritmos Num�ricos

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

% Dados
beta = 2;% Base;
t =3;% N�mero de algarismos significativos;
m = -1;% Limite inferior expoente;
M = 2;% Limite superior expoente;
Nun = zeros(17,5);% Matriz conjunto de n�meros possiveis;

% ------------------------------------------------------------------------------

% C�lculando os valores possiveis
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