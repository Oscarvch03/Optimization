clc
% format long

f = @(x) exp(-x) + x.^2 + 5;
x = -1:0.01:5;
f_x = f(x);
[mi, i1] = min(f_x);
[ma, i2] = max(f_x);
figure(1)
p = plot(x, f_x, 'r');
p(1).LineWidth = 2.1;
title("f(x) = exp(-x) + x^2 + 5")
xlim([-1, 5])
ylim([mi, ma])
xlabel("x")
ylabel("f(x)")
saveas(gcf, "funcion.png")

err = 0.0002;
verbose = true;

%% Método de la Sección Áurea

disp("Seccion Aurea: ");
a_0 = -1;
b_0 = 5;
[a_f, b_f, a, b] = seccion_aurea(a_0, b_0, f, err, verbose);
disp("x \in: ")
disp([a_f, b_f])

figure(2)
title("Reduccion de Intervalo")
xlabel("[a, b]")
ylabel("Iteracion")
hold on
for i = 1:length(a)
    p = plot([a(i), b(i)], [i, i]);
    p(1).LineWidth = 2.1;
    hold on
end
saveas(gcf, "intervalos.png")

razon = [];
for j = 1:(length(a) - 1)
    razon(j) = (b(j) - a(j)) / (b(j + 1) - a(j + 1)); 
end
disp("El factor de reduccion entre cada iteracion es aprox: " + num2str(razon(1)))


