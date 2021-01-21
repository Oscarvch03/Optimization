clc
% format long

f = @(x) 8 * exp(1-x) + 7 * log(x);
x = 1:0.01:2;
f_x = f(x);
[mi, i1] = min(f_x);
[ma, i2] = max(f_x);
figure(1)
p = plot(x, f_x, 'r');
p(1).LineWidth = 2.1;
title("f(x) = 8 * exp(1-x) + 7 * log(x)")
xlim([-1, 5])
ylim([mi, ma])
xlabel("x")
ylabel("f(x)")
saveas(gcf, "funcion.png")

err = 0.1;
verbose = true;

%% Método de la Sección Áurea

disp("Seccion Aurea: ");
a_0 = 1;
b_0 = 2;
[a_f, b_f, a, b] = seccion_aurea(a_0, b_0, f, err, verbose);
disp("x \in: ")
disp([a_f, b_f])

figure(2)
title("Reduccion de Intervalo")
xlabel("[a, b]")
ylabel("Iteracion")
hold on
for i = 1:length(a)
    p = plot([a(i), b(i)], [i-1, i-1]);
    p(1).LineWidth = 2.1;
    hold on
end
saveas(gcf, "intervalos.png")



