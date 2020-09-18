function x = ajuste_cuadratico(x_1, x_2, x_3, f, err)

%     format long

    x1 = [x_1];
    x2 = [x_2];
    x3 = [x_3];
    
    b_12 = x_1^2 - x_2^2;
    b_23 = x_2^2 - x_3^2;
    b_31 = x_3^2 - x_1^2;
    num = b_23 * f(x_1) + b_31 * f(x_2) + b_12 * f(x_3);
    
    a_12 = x_1 - x_2;
    a_23 = x_2 - x_3;
    a_31 = x_3 - x_1;
    den = 2 * (a_23 * f(x_1) + a_31 * f(x_2) + a_12 * f(x_3));
    
    x_k = num / den;
    xk = [x_k];
    
    k = 1;
    
    while(true)
        if(x3(k) - x1(k) < err)
            x = xk(k - 1);
            break;
        else
            if(xk(k) > x2(k))
                if(f(xk(k)) >= f(x2(k)))
                    x1(k + 1) = x1(k);
                    x2(k + 1) = x2(k);
                    x3(k + 1) = xk(k);
                elseif(f(xk(k)) < f(x2(k)))
                    x1(k + 1) = x2(k);
                    x2(k + 1) = xk(k);
                    x3(k + 1) = x3(k);
                end
            elseif(xk(k) < x2(k))    
                if(f(xk(k)) >= f(x2(k)))
                    x1(k + 1) = xk(k);
                    x2(k + 1) = x2(k);
                    x3(k + 1) = x3(k);
                elseif(f(xk(k)) < f(x2(k)))
                    x1(k + 1) = x1(k);
                    x2(k + 1) = xk(k);
                    x3(k + 1) = x2(k);
                end
            end
            
            b_12_k = x1(k + 1)^2 - x2(k + 1)^2;
            b_23_k = x2(k + 1)^2 - x3(k + 1)^2;
            b_31_k = x3(k + 1)^2 - x1(k + 1)^2;
            num_k = b_23_k * f(x1(k + 1)) + b_31_k * f(x2(k + 1)) + b_12_k * f(x3(k + 1));

            a_12_k = x1(k + 1) - x2(k + 1);
            a_23_k = x2(k + 1) - x3(k + 1);
            a_31_k = x3(k + 1) - x1(k + 1);
            den_k = 2 * (a_23_k * f(x1(k + 1)) + a_31_k * f(x2(k + 1)) + a_12_k * f(x3(k + 1)));

            xk(k + 1) = num_k / den_k;

            if(xk(k) == x2(k))
                if(x2(k) - x1(k) < x3(k) - x2(k))
                    xk(k + 1) = x2(k) + err / 2;
                    x1(k + 1) = x1(k);
                    x2(k + 1) = x2(k);
                    x3(k + 1) = xk(k);
                elseif(x2(k) - x1(k) > x3(k) - x2(k))
                    xk(k + 1) = x2(k) - err / 2;
                    x1(k + 1) = x1(k);
                    x2(k + 1) = xk(k);
                    x3(k + 1) = x2(k);
                end 
            end
            [x1(k), x2(k), x3(k)];
            k = k + 1;
        end
    end
    k
    
end