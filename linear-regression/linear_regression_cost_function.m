function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
    [rows, ~] = size(FeatureMatrix);
    %ignoram Theta(1), care va fi zero
    Theta = Theta(2:end);

    Error = sum((FeatureMatrix * Theta - Y)' * (FeatureMatrix * Theta - Y) );
    Error = Error / 2 / rows;
    
endfunction
