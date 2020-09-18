function [a_f, b_f] = seccion_aurea(a_0, b_0, f, err)

    format long

    alpha = 0.618; % Numero Dorado
    
    lmd_0 = a_0 + (1 - alpha) * (b_0 - a_0);
    f_lmd_0 = f(lmd_0);
    u_0 = a_0 + alpha * (b_0 - a_0);
    f_u_0 = f(u_0);
    
    a = [a_0];
    b = [b_0];
    lmd = [lmd_0];
    u = [u_0];
    f_lmd = [f_lmd_0];
    f_u = [f_u_0];
    
    k = 1;
    while(true)
        if(b(k) - a(k) < err)
            a_f = a(k);
            b_f = b(k);
            break;
        else
            if(f_lmd(k) > f_u(k))
                a(k + 1) = lmd(k);
                b(k + 1) = b(k);
                lmd(k + 1) = u(k);
                u(k + 1) = a(k + 1) + alpha * (b(k + 1) - a(k + 1));
            else
                a(k + 1) = a(k);
                b(k + 1) = u(k);
                u(k + 1) = lmd(k);
                lmd(k + 1) = a(k + 1) + (1 - alpha) * (b(k + 1) - a(k + 1));
            end
            f_lmd(k + 1) = f(lmd(k + 1));
            f_u(k + 1) = f(u(k + 1));
            k = k + 1;
        end
    end
    k
    
end