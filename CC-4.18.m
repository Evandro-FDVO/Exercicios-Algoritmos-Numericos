% ------------------------------------------------------------------------------

% Exerc�cio  CC-4.18 - Algoritmos Num�ricos

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
x = 0:0.01:pi;% Valor de x;
x0 = pi/2;% Valor de x0;
fx0 = x0-1-0.5*sin(x0);% Fun��o f(x0);
fx = x-1-0.5*sin(x);% Fun��o f(x);
erro = 0.015;% Erro m�ximo;

der1_f = 1-0.5*cos(x0);% Primeira derivada da fun��o f(x0);
der2_f = 0.5*sin(x0);% Segunda derivada da fun��o f(x0);
der3_f = 0.5*cos(x0);% Terceira derivada da fun��o f(x0);
der4_f = -0.5*sin(x0);% Quarta derivada da fun��o f(x0);

% ------------------------------------------------------------------------------

% Erro a partir da s�rie de Taylor

erro_1=abs(fx-(fx0+der1_f.*(x-x0)));
erro_2=abs(fx-(fx0+der1_f.*(x-x0)+(der2_f.*((x-x0).^2)./2)));
erro_3=abs(fx-(fx0+der1_f.*(x-x0)+(der2_f.*((x-x0).^2)./2)+(der3_f.*((x-x0).^3)./6)));
erro_4=abs(fx-(fx0+der1_f.*(x-x0)+(der2_f.*((x-x0).^2)./2)+(der3_f.*((x-x0).^3)./6)+(der4_f.*((x-x0).^4)./24)));


disp("Erro no ponto x=0 para uma s�rie de Taylor de 1� ordem: "), erro_1(1)
disp("\nErro no ponto x=0 para uma s�rie de Taylor de 2� ordem: "), erro_2(1)
disp("\nErro no ponto x=0 para uma s�rie de Taylor de 3� ordem: "), erro_3(1)
disp("\nErro no ponto x=0 para uma s�rie de Taylor de 4� ordem: "), erro_4(1)

% Gr�ficos
plot(x,erro_1);
title('1� Ordem');
xlabel('x');
ylabel('Erro');
figure;

plot(x,erro_2);
title('2� Ordem');
xlabel('x');
ylabel('Erro');
figure;

plot(x,erro_3);
title('3� Ordem');
xlabel('x');
ylabel('Erro');
figure;

plot(x,erro_4);
title('4� Ordem');
xlabel('x');
ylabel('Erro');

% ------------------------------------------------------------------------------