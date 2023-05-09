function [Theta1, Theta2] = get_theta(params, input_layer_size, hidden_layer_size, ...
                   output_layer_size)
    %pentru simplitate salvam dimensiunile matricelor Theta
    theta1_size = [hidden_layer_size, input_layer_size + 1];
    theta2_size = [output_layer_size, hidden_layer_size + 1];
   
    %cream matricele Theta
    Theta1 = reshape(params(1 : prod(theta1_size)), theta1_size(1), theta1_size(2));
    Theta2 = reshape(params((prod(theta1_size) + 1) : end), theta2_size(1), theta2_size(2));
endfunction