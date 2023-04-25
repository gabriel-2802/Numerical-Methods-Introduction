function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
    [rows cols] = size(FeaturesMatrix);
    Theta = zeros(cols, 1);
    
    %testam daca matricea e pozitiv def
    eigvals = eig(FeaturesMatrix' * FeaturesMatrix);
    if !all(eigvals > 0)
        return
    endif
    
    Theta = gradient_function(FeaturesMatrix' * FeaturesMatrix, FeaturesMatrix' * Y, Theta, tol, iter);
endfunction