function [Error] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)
    Error = 0;
    [rows cols] = size(FeMatrix);
    Theta = Theta(2:end);
    for i = 1 : rows
        Error = Error + (Theta' * FeMatrix(i, :)' - Y(i,1)) ^ 2;
    endfor
    
    Error = Error  / 2 / rows;
    Error = Error + lambda * (Theta' * Theta);
endfunction
