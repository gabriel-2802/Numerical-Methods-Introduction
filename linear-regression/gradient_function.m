function [x] = gradient_function(A, b, x_0, tol, max_iter)
    r = b - A * x_0;
    v = r;
    x = x_0;
    tol_sq = tol * tol;
    k = 1;

    while k < max_iter && (r' * r) > tol_sq
        t = (r' * r) / (v' * A * v);
        x = x + t * v;
        r_new = r - t * A * v;
        s = (r_new' * r_new) / (r' * r);
        v = r_new + s * v;
        k = k + 1;
        r = r_new; 
    endwhile
endfunction
