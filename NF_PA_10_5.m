% ------------------------------------------------------------------------------

% Exercício  NF PA-10.5 - Algoritmos Numéricos

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
T_1A = [5 10 15];
T_2A = [5 10 15 20];
T_1B = [20 25 30];
T_2B = [20 25 30 35];

rho_1A = [0.9998 0.9997 0.9991];
rho_2A = [0.9998 0.9997 0.9991 0.9982];
rho_1B = [0.9982 0.9971 0.9957];
rho_2B = [0.9982 0.9971 0.9957 0.9941];

n1 = 2;% Grau do parábola;
n2 = 3;% Grau do parábola;

x1 = 13;% T(13);
x2 = 27;% T(27);

xk_xj_1A = zeros(n1+1, n1+1);% (xk ? xj);
xk_xj_2A = zeros(n2+1, n2+1);% (xk ? xj);
xk_xj_1B = zeros(n1+1, n1+1);% (xk ? xj);
xk_xj_2B = zeros(n2+1, n2+1);% (xk ? xj);

Dk_1A = ones(n1+1, 1);% (xk ? x1)*(xk ? x2)*(xk ? x3)...;
Dk_2A = ones(n2+1, 1);% (xk ? x1)*(xk ? x2)*(xk ? x3)...;
Dk_1B = ones(n1+1, 1);% (xk ? x1)*(xk ? x2)*(xk ? x3)...;
Dk_2B = ones(n2+1, 1);% (xk ? x1)*(xk ? x2)*(xk ? x3)...;

fk_1A = zeros(n1+1, 1);% rho;
fk_2A = zeros(n2+1, 1);% rho;
fk_1B = zeros(n1+1, 1);% rho;
fk_2B = zeros(n2+1, 1);% rho;

fk_Dk_1A = zeros(n1+1, 1);% fk/Dk;
fk_Dk_2A = zeros(n2+1, 1);% fk/Dk;
fk_Dk_1B = zeros(n1+1, 1);% fk/Dk;
fk_Dk_2B = zeros(n2+1, 1);% fk/Dk;

sum_fk_Dk_1A = 0;% soma dos fk/Dk;
sum_fk_Dk_2A = 0;% soma dos fk/Dk;
sum_fk_Dk_1B = 0;% soma dos fk/Dk;
sum_fk_Dk_2B = 0;% soma dos fk/Dk;

pi_3_13 = 1;
pi_4_13 = 1;

pi_3_27 = 1;
pi_4_27 = 1;

% ------------------------------------------------------------------------------

% Método de Lagrange 1A & 1B
for k = 1:n1+1
  for j = 1:n1+1
    if k == j
      xk_xj_1A(k,j) = x1 - T_1A(j);
      xk_xj_1B(k,j) = x2 - T_1B(j);
    endif
    if k ~= j
      xk_xj_1A(k,j) = T_1A(k) - T_1A(j);
      xk_xj_1B(k,j) = T_1B(k) - T_1B(j);
    endif
    Dk_1A(k) = Dk_1A(k)*xk_xj_1A(k,j);
    Dk_1B(k) = Dk_1B(k)*xk_xj_1B(k,j);
    
    fk_1A(k) = rho_1A(k);
    fk_1B(k) = rho_1B(k);
    
    fk_Dk_1A(k) = fk_1A(k)/Dk_1A(k);
    fk_Dk_1B(k) = fk_1B(k)/Dk_1B(k);
  endfor
  sum_fk_Dk_1A = sum_fk_Dk_1A + fk_Dk_1A(k);
  sum_fk_Dk_1B = sum_fk_Dk_1B + fk_Dk_1B(k);
  
  pi_3_13 = pi_3_13*(x1-T_1A(k));
  pi_3_27 = pi_3_27*(x2-T_1B(k));
endfor

sol_1A = pi_3_13*sum_fk_Dk_1A;
sol_1B = pi_3_27*sum_fk_Dk_1B;

% ------------------------------------------------------------------------------

% Método de Lagrange 2A & 2B
for k = 1:n2+1
  for j = 1:n2+1
    if k == j
      xk_xj_2A(k,j) = x1 - T_2A(j);
      xk_xj_2B(k,j) = x2 - T_2B(j);
    endif
    if k ~= j
      xk_xj_2A(k,j) = T_2A(k) - T_2A(j);
      xk_xj_2B(k,j) = T_2B(k) - T_2B(j);
    endif
    Dk_2A(k) = Dk_2A(k)*xk_xj_2A(k,j);
    Dk_2B(k) = Dk_2B(k)*xk_xj_2B(k,j);
    
    fk_2A(k) = rho_2A(k);
    fk_2B(k) = rho_2B(k);
    
    fk_Dk_2A(k) = fk_2A(k)/Dk_2A(k);
    fk_Dk_2B(k) = fk_2B(k)/Dk_2B(k);
  endfor
  sum_fk_Dk_2A = sum_fk_Dk_2A + fk_Dk_2A(k);
  sum_fk_Dk_2B = sum_fk_Dk_2B + fk_Dk_2B(k);
  
  pi_4_13 = pi_4_13*(x1-T_2A(k));
  pi_4_27 = pi_4_27*(x2-T_2B(k));
endfor

sol_2A = pi_4_13*sum_fk_Dk_2A;
sol_2B = pi_4_27*sum_fk_Dk_2B;

% ------------------------------------------------------------------------------

printf("O valor de rho2(13) é: %f\n", sol_1A);
printf("O valor de rho3(13) é: %f\n", sol_2A);
printf("O valor de rho2(27) é: %f\n", sol_1B);
printf("O valor de rho3(27) é: %f\n", sol_2B);

% ------------------------------------------------------------------------------