function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
    [rows cols] = size(FeMatrix);
    Error = 0;
    
    for i = 1 : rows
       Error = Error + (Y(i,1) - (Theta' * FeMatrix(i, :)')) ^ 2;
    endfor
    Error = Error / rows;
    Error = Error + lambda * norm(Theta);
endfunction
