function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)
    [rows cols] = size(FeatureMatrix);
    Theta = zeros(cols, 1);
    
    k = 1;
    while k <= iter
        for j = 1 : cols
            grd = 0;
            for i = 1 : rows
                grd = grd + FeatureMatrix(i, j) * (Theta' * FeatureMatrix(i, :)' - Y(i, 1));
            endfor
            grd = grd /rows;
            Theta(j, 1) = Theta(j, 1) - alpha * grd;;
        endfor
        k = k + 1;
    endwhile

    Theta = [0; Theta]; 
endfunction
