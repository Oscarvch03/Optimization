clc
format long

f = @(x) (x^2 / 10) - 2 * sin(x);
err = 0.0002;

%% Método de la Sección Áurea

disp("Seccion Aurea: ");
a_0 = 0;
b_0 = 4;
[a_f, b_f] = seccion_aurea(a_0, b_0, f, err)


%% Método de Ajuste Cuadrático

disp("Ajuste Cuadratico");
x_1 = 0;
x_2 = 1;
x_3 = 4;
x = ajuste_cuadratico(x_1, x_2, x_3, f, err)


%% Método de Newton


