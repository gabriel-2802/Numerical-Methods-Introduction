function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)
   
   %unrolling params
   [Theta1, Theta2] = get_theta(params, input_layer_size, hidden_layer_size, output_layer_size);
   
   [rows, ~] = size(X);

    %expandam y
    Y = zeros(rows, 10);
    for i = 1 : rows
        Y(i, y(i)) = 1;
    endfor
    
    %lucram matriceal
    [a1 a2 a3 z2 z3 h] = forward_propag(rows, Theta1, Theta2, X);

    %calculam termenul cu lambda
    lambda_term = 0;
    lambda_term = sum(sum(Theta1(:, 2:end) .* Theta1(:, 2:end), 2)) + sum(sum(Theta2(:, 2:end) .* Theta2(:, 2:end), 2));

    % calculam costul
    J = sum(sum((-Y) .* log(h) - (1 - Y) .* log(1 - h), 2)) / rows + lambda * lambda_term / 2 / rows;

    % calculate deltas
    delta3 = a3 .- Y;
    Delta2 = delta3' * a2;

    delta2 = (delta3 * Theta2(:, 2 : end)) .* (sigmoid(z2) .* (1 - sigmoid(z2)));
    Delta1 = delta2' * a1;

    Delta1 = Delta1 / rows;
    Delta2 = Delta2 / rows;

    Theta1(:, 1) = 0;
    Theta2(:, 1) = 0;
    Delta1 = Delta1 + lambda / rows * Theta1;
    Delta2 = Delta2 + lambda / rows * Theta2;

    grad = [Delta1(:) ; Delta2(:)];

endfunction
