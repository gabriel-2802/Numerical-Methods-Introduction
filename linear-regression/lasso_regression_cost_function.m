function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
    [rows ~] = size(FeMatrix);
    Theta = Theta(2:end);

    Error = sum((Y - FeMatrix * Theta)' * (Y - FeMatrix * Theta));
    Error = Error / rows;
    Error = Error + lambda * sum(abs(Theta));
endfunction
