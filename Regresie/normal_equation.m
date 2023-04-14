function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
    [rows cols] = size(FeaturesMatrix);
    Theta = zeros(cols, 1);
    
    if rows != cols
        return
    endif
    
    %testam daca matricea e pozitiv def
    eigvals = eig(FeaturesMatrix);
    if !all(eigvals > 0)
        return
    endif
    
    Theta = gradient(FeaturesMatrix' * FeaturesMatrix, FeaturesMatrix' * Y, Theta, tol, iter);
endfunction