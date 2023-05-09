function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
    [rows cols] = size(FeaturesMatrix);
    Theta = zeros(cols, 1);
    
    %testam daca matricea este pozitiv def
    eigvals = eig(FeaturesMatrix' * FeaturesMatrix);
    if !all(eigvals > 0)
        Theta = [0; Theta];
        return
    endif
    %aplicam gradientul
    Theta = gradient_function(FeaturesMatrix' * FeaturesMatrix, FeaturesMatrix' * Y, Theta, tol, iter);
    Theta = [0; Theta];
endfunction