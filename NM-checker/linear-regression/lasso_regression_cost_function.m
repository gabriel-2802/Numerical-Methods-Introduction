function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
    [rows cols] = size(FeMatrix);
    Error = 0;
    Theta = Theta(2:end);
    for i = 1 : rows
       Error = Error + (Y(i,1) - (Theta' * FeMatrix(i, :)')) * (Y(i,1) - (Theta' * FeMatrix(i, :)')) ;
    endfor
    Error = Error / rows;
    Error = Error + lambda * sum(abs(Theta));
endfunction
