% ------------------------------------------------------------------------------

% Exercício  CC-12.33 - Algoritmos Numéricos

% Desenvolvedores:  André Depra
%                   Evandro Falcão
%                   Rebeca Lube

% ------------------------------------------------------------------------------

% Evitar Bug
clc
clear all
close all

% ------------------------------------------------------------------------------

% Dados iniciais
m = 1500;% Massa [Kg];
g = 9.81;% Gravidade [m/s^2];

k1 = 100;% Rigidez da mola 1 [N/m];
k2 = 50;% Rigidez da mola 1 [N/m];
k3 = 80;% Rigidez da mola 3 [N/m];
k4 = 200;% Rigidez da mola 4 [N/m];
F = m*g;% Força aplicada [N];

% ------------------------------------------------------------------------------

% Matrizes A e b
A = [-k1-k2 k2 0 0; k2 -k2-k3 k3 0; 0 k3 -k3-k4 k4; 0 0 k4 -k4];% Matriz A
b = [0; 0; 0; -F];% Matriz b;

% Variáveis
l = length(A);% Tamanho da matriz A;

A_esc = zeros(l,l);% Alocando espaço para a Matriz Escalonada 'A_esc' a partir da matriz A;
d = zeros(1,l-1);% Alocando espaço para o vetor 'd' a partir da matriz A;
e = zeros(1,l);% Alocando espaço para o vetor 'e' a partir da matriz A;
f = zeros(1,l-1);% Alocando espaço para o vetor 'f' a partir da matriz A;

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
for i = 1:l
  for j = 1:l
    if i == j
     e(1,j) = A_esc(i,j);
     U(j,j) = e(1,j);
     L(j,j) = 1;
    endif
    if j <= l-1
      d(1,j) = A_esc(j,j+1);
      U(j,j+1) = d(1,j);
    endif
    if j <= l-1
      f(1,j) = A_esc(j+1,j);
      L(j+1,j) = f(1,j);
    endif
  endfor
endfor

% ------------------------------------------------------------------------------

% Solução para a Decomposição LU: Ly=b -> Ux=y
%X_comparacao=A\b% Valor comparativo;

%Ly=b
y1 = b(1);
y2 = b(2)-(L(2,1)*y1);
y3 = b(3)-(L(3,2)*y2);
y4 = b(4)-(L(4,3)*y3);

%Ux=y
x4 = y4/U(4,4);
x3 = (y3 - U(3,4)*x4)/U(3,3);
x2 = (y2 - U(2,3)*x3)/U(2,2);
x1 = (y1 - U(1,2)*x2)/U(1,1);

printf("O valor de x1 é: %f\n", x1);
printf("O valor de x2 é: %f\n", x2);
printf("O valor de x3 é: %f\n", x3);
printf("O valor de x4 é: %f\n", x4);

% ------------------------------------------------------------------------------