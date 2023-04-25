function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
    [rows, cols] = size(FeatureMatrix);
    Error = 0;
    Theta = Theta(2:end);
    for i = 1 : rows
        Error = Error + (Theta' * FeatureMatrix(i, :)' - Y(i,1)) ^ 2;
    endfor
    
    Error = Error / 2 / rows;
    
endfunction
