% ------------------------------------------------------------------------------

% Exercício  CC-4.18 - Algoritmos Numéricos

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
x = 0:0.01:pi;% Valor de x;
x0 = pi/2;% Valor de x0;
fx0 = x0-1-0.5*sin(x0);% Função f(x0);
fx = x-1-0.5*sin(x);% Função f(x);
erro = 0.015;% Erro máximo;

der1_f = 1-0.5*cos(x0);% Primeira derivada da função f(x0);
der2_f = 0.5*sin(x0);% Segunda derivada da função f(x0);
der3_f = 0.5*cos(x0);% Terceira derivada da função f(x0);
der4_f = -0.5*sin(x0);% Quarta derivada da função f(x0);

% ------------------------------------------------------------------------------

% Erro a partir da série de Taylor

erro_1=abs(fx-(fx0+der1_f.*(x-x0)));
erro_2=abs(fx-(fx0+der1_f.*(x-x0)+(der2_f.*((x-x0).^2)./2)));
erro_3=abs(fx-(fx0+der1_f.*(x-x0)+(der2_f.*((x-x0).^2)./2)+(der3_f.*((x-x0).^3)./6)));
erro_4=abs(fx-(fx0+der1_f.*(x-x0)+(der2_f.*((x-x0).^2)./2)+(der3_f.*((x-x0).^3)./6)+(der4_f.*((x-x0).^4)./24)));


disp("Erro no ponto x=0 para uma série de Taylor de 1ª ordem: "), erro_1(1)
disp("\nErro no ponto x=0 para uma série de Taylor de 2ª ordem: "), erro_2(1)
disp("\nErro no ponto x=0 para uma série de Taylor de 3ª ordem: "), erro_3(1)
disp("\nErro no ponto x=0 para uma série de Taylor de 4ª ordem: "), erro_4(1)

% Gráficos
plot(x,erro_1);
title('1ª Ordem');
xlabel('x');
ylabel('Erro');
figure;

plot(x,erro_2);
title('2ª Ordem');
xlabel('x');
ylabel('Erro');
figure;

plot(x,erro_3);
title('3ª Ordem');
xlabel('x');
ylabel('Erro');
figure;

plot(x,erro_4);
title('4ª Ordem');
xlabel('x');
ylabel('Erro');

% ------------------------------------------------------------------------------