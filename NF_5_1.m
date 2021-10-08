% ------------------------------------------------------------------------------

% Exercício  NF-5.1 - Algoritmos Numéricos

% Desenvolvedores:  André Depra
%                   Evandro Falcão
%                   Rebeca Lube

% ------------------------------------------------------------------------------

% Evitar Bug
clc
clear all
close all

% ------------------------------------------------------------------------------

% Dados iniciais - Matrizes A e b
A =[4 -1 0 -1 0 0; -1 4 -1 0 -1 0; 0 -1 4 0 0 -1; -1 0 0 4 -1 0; 0 -1 0 -1 4 -1; 0 0 -1 0 -1 4];
b= [100; 0; 0; 100; 0; 0];

% ------------------------------------------------------------------------------

% Variáveis
l = length(A);
A_esc = zeros(l,l);% Alocando espaço para a Matriz Escalonada 'A_esc' a partir da matriz A;

% ------------------------------------------------------------------------------

% Escalonamento da Matriz 'A'
A_esc = A;

for k=1:l-1
  for j=k+1:l
    lambda=A_esc(j,k)/A_esc(k,k);
    A_esc(j,k)=lambda;
    for i=k+1:l
      A_esc(j,i)=A_esc(j,i)-lambda*A_esc(k,i);
    endfor
  endfor
endfor
% ------------------------------------------------------------------------------

% Lendo a matriz 'A_esc' e atribuindo valores às matrizes 'L' e 'U'

L = zeros(l,l);
U = zeros(l,l);

for i = 1:l
  for j = 1:l
    if i == j
     U(i,j) = A_esc(i,j);
     L(i,j) = 1;
    endif
    if j > i
      U(i,j) = A_esc(i,j);
      L(i,j) = 0;
    endif
    if j < i
      U(i,j) = 0;
      L(i,j) = A_esc(i,j);
    endif
  endfor
endfor

% ------------------------------------------------------------------------------

% Solução para a Decomposição LU: Ly=b -> Ux=y
%X_comparacao=A\b% Valor comparativo;

%Ly=b
y1 = b(1);
y2 = b(2)-(L(2,1)*y1);
y3 = b(3)-(L(3,1)*y1)-(L(3,2)*y2);
y4 = b(4)-(L(4,1)*y1)-(L(4,2)*y2)-(L(4,3)*y3);
y5 = b(5)-(L(5,1)*y1)-(L(5,2)*y2)-(L(5,3)*y3)-(L(5,4)*y4);
y6 = b(6)-(L(6,1)*y1)-(L(6,2)*y2)-(L(6,3)*y3)-(L(6,4)*y4)-(L(6,5)*y5);

%Ux=y
x6 = y6/U(6,6);
x5 = (y5-U(5,6)*x6)/U(5,5);
x4 = (y4-U(4,5)*x5-U(4,6)*x6)/U(4,4);
x3 = (y3-U(3,4)*x4-U(3,5)*x5-U(3,6)*x6)/U(3,3);
x2 = (y2-U(2,3)*x3-U(2,4)*x4-U(2,5)*x5-U(2,6)*x6)/U(2,2);
x1 = (y1-U(1,2)*x2-U(1,3)*x3-U(1,4)*x4-U(1,5)*x5-U(1,6)*x6)/U(1,1);

printf("O valor de x1 é: %f\n", x1);
printf("O valor de x2 é: %f\n", x2);
printf("O valor de x3 é: %f\n", x3);
printf("O valor de x4 é: %f\n", x4);
printf("O valor de x5 é: %f\n", x5);
printf("O valor de x6 é: %f\n", x6);

% ------------------------------------------------------------------------------