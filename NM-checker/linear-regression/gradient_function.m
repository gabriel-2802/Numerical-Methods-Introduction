function [x] = gradient(A, b, x_0, tol, max_iter)
    r = b - A * x_0;
    v = r;
    x = x_0;
    tol_sq = tol * tol;
    k = 1;
    while k < max_iter && r' * r > tol_sq
        t = r' * r / (v' * A * v);
        x = x + t * v;
        r = r - t * A * v;
        s = r' * r / (v' * v);
        v = r + s * v;
        k = k + 1; 
    endwhile
endfunction
