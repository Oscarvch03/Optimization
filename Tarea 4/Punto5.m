clc

syms x1 x2
P = 2 * exp(x1) + 3 * x1 ^ 2 + 2 * x1 * x2 + 4 * x2 ^ 2 + 10 * (3 * x1 + 2 * x2 - 6)^2;
pretty(P)
disp("-------------------------------------------------------")

X = [1, 1];
Xf = Descenso_Gradiente(P, X, 0.001, 2)