function [x] = gradient_function(A, b, x_0, tol, max_iter)
    r = b - A * x_0;
    v = r;
    x = x_0;
    tol_sq = tol * tol;
    k = 1;
    prev_r = r;
    while k <= max_iter && r' * r > tol_sq
        t = r' * r / (v' * A * v);
        x = x + t * v;
        r = prev_r - t * A * v;
        s = r' * r / (prev_r' * prev_r);
        v = r + s * v;
        k = k + 1;
       prev_r = r; 
    endwhile
endfunction
