% ------------------------------------------------------------------------------

% Exercício  CC-12.29 - Algoritmos Numéricos

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
A = [55 0 -25; 0 -37 -4; -25 -4 29];
b = [-200; -250; 100];

% ------------------------------------------------------------------------------

% Variáveis
l = length(A);
A_esc = zeros(l,l);% Alocando espaço para a Matriz Escalonada 'A_esc' a partir da matriz A;

% ------------------------------------------------------------------------------

% Escalonamento da Matriz 'A'

A_esc = A;
A_esc(3,1) = (A_esc(3,1)/A_esc(1,1));
A_esc(3,2) = ((A_esc(3,2))-(A_esc(1,2)*(A_esc(3,1))));
A_esc(3,3) = ((A_esc(3,3))-(A_esc(1,3)*(A_esc(3,1))));

A_esc(3,2) = (A_esc(3,2)/A_esc(2,2));
A_esc(3,3) = ((A_esc(3,3))-(A_esc(2,3)*(A_esc(3,2))));
% ------------------------------------------------------------------------------

% Lendo a matriz 'A_esc' e atribuindo valores às matrizes 'L' e 'U'

L = zeros(l,l);
U = zeros(l,l);

U(1,1) = A_esc(1,1);
U(1,2) = A_esc(1,2);
U(1,3) = A_esc(1,3);

U(2,2) = A_esc(2,2);
U(2,3) = A_esc(2,3);

U(3,3) = A_esc(3,3);

L(2,1) = A_esc(2,1);
L(3,1) = A_esc(3,1);
L(3,2) = A_esc(3,2);

L(1,1) = 1;
L(2,2) = 1;
L(3,3) = 1;

% ------------------------------------------------------------------------------

% Solução para a Decomposição LU: Ly=b -> Ux=y
%X_comparacao=A\b% Valor comparativo;

%Ly=b
y1 = b(1);
y2 = b(2);
y3 = b(3)-(L(3,1)*y1)-(L(3,2)*y2);

%Ux=y
x3 = y3/U(3,3);
x2 = (y2 - U(2,3)*x3)/U(2,2);
x1 = (y1 - (U(1,2)*x2)- U(1,3)*x3)/U(1,1);

printf("O valor de I1 é: %f\n", x1);
printf("O valor de I2 é: %f\n", x2);
printf("O valor de I3 é: %f\n", x3);

% ------------------------------------------------------------------------------