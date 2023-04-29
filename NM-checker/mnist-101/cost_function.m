function [J, grad] = cost_function(params, X, y, lambda, ...
                   input_layer_size, hidden_layer_size, ...
                   output_layer_size)
   
   theta1_size = [hidden_layer_size, input_layer_size + 1];
   theta2_size = [output_layer_size, hidden_layer_size + 1];
   
   theta1 = reshape(params(1 : prod(theta1_size)), theta1_size(1), theta1_size(2));
   theta2 = reshape(params((prod(theta1_size) + 1) : end), theta2_size(1), theta2_size(2));
   
   rows = size(X,1);
   %expandam y
    Y = zeros(rows, 10);
    for i = 1 : rows
        Y(i, y(i)) = 1;
    endfor
    
    [h, grad] = find_h(X, theta1, theta2, rows, lambda, Y);
    J = 0;
    
    for i = 1 : rows
        for k = 1 : 10
            J = J - Y(i,k) * log(h(i,k)) - (1 - Y(i,k)) * log(1 - h(i,k)); 
        endfor
    endfor
    J = J / rows;
    lambda_termen = 0;
    
    for j = 2 : input_layer_size + 1
        for k = 1 : hidden_layer_size
            lambda_termen = lambda_termen + theta1(k,j)^2;
        endfor
    endfor
    
    for j = 2 : hidden_layer_size + 1
        for k = 1 : output_layer_size
            lambda_termen = lambda_termen +  theta2(k,j)^2;
        endfor
    endfor
    
     lambda_termen = lambda * lambda_termen / 2 / rows;
     J = J + lambda_termen;

endfunction
