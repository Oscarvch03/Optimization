function Xf = Descenso_Gradiente(f, X, epsilon, it)
    % Donde f es una funcion simbolica
    syms lmd x1 x2
    k = 0;
    x_k = X';
    while(double(norm(subs(gradient(f), [x1, x2], [x_k(1), x_k(2)]))) > epsilon)
        if(k == it)
            break
        end
        k
        d_k = -double(subs(gradient(f), [x1, x2], [x_k(1), x_k(2)]))
        f_aux = x_k + lmd * d_k;
        f_new = simplify(subs(f, [x1, x2], [f_aux(1), f_aux(2)]));
        lmd_k = Newton_Unid(0, f_new, epsilon)
        x_k = double(x_k + lmd_k * d_k)
        k = k + 1;
        disp("-----------------------------------------------------------------")
    end
    k
    Xf = double(x_k);
end