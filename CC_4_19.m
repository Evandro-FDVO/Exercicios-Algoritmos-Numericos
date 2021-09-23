% ------------------------------------------------------------------------------

% Exercício  CC-4.19 - Algoritmos Numéricos

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

h = 0.25;% Passo;

x = -2:0.25:2;% Variável;
f = (x.^3) - 2.*x + 4;% Função xi;

f_i_mais_1 = ((x+h).^3) - 2.*(x+h) + 4;% Função xi;% Função xi+1;
f_i_menos_1 = ((x-h).^3) - 2.*(x-h) + 4;% Função xi;% Função xi-11;

f_i_mais_2 = ((x+(2*h)).^3) - 2.*(x+(2*h)) + 4;% Função xi;% Função xi+2;
f_i_menos_2 = ((x-(2*h)).^3) - 2.*(x-(2*h)) + 4;% Função xi;% Função xi-2;


der_1_teorico = (3.*x.^2) - 2;% Primeira derivada de f(x);
der_2_teorico = 6.*x;% Segunda derivada de f(x);

der_1_progressiva = (f_i_mais_1-f)/h;% Primeira derivada por dois pontos (Progressiva) de f(x);
der_1_centrada = (f_i_mais_1-f_i_menos_1)/(2*h);% Primeira derivada por dois pontos (Centrada) de f(x);
der_1_regressiva = (f-f_i_menos_1)/h;% Primeira derivada por dois pontos (Regressiva) de f(x);


der_2_progressiva = (f-2.*f_i_mais_1+f_i_mais_2)/(h^2);% Segunda derivada por dois pontos (Progressiva) de f(x);
der_2_centrada = (f_i_mais_1-2.*f+f_i_menos_1)/(h^2);% Segunda derivada por dois pontos (Centrada) de f(x);
der_2_regressiva = (f-2.*f_i_menos_1+f_i_menos_2)/(h^2);% Segunda derivada por dois pontos (Regressiva) de f(x);

% ------------------------------------------------------------------------------

% Gráficos
hold on
plot(x,der_1_teorico,";Teórica;");
plot(x,der_1_progressiva,";Progressiva;");
plot(x,der_1_centrada,";Centrada;");
plot(x,der_1_regressiva,";Regressiva;");
title('1ª Derivada teórica');
xlabel('x');
ylabel('y');
hold off

figure;

hold on
plot(x,der_2_teorico,";Teórica;");
plot(x,der_2_progressiva,";Progressiva;");
plot(x,der_2_centrada,";Centrada;");
plot(x,der_2_regressiva,";Regressiva;");
title('2ª Derivada teórica');
xlabel('x');
ylabel('y');
hold off

% ------------------------------------------------------------------------------