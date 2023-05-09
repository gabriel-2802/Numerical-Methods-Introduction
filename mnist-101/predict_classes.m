function [classes] = predict_classes(X, weights, ...
                  input_layer_size, hidden_layer_size, ...
                  output_layer_size)

    [Theta1, Theta2] = get_theta(weights, input_layer_size, hidden_layer_size, output_layer_size);
    [rows, ~] = size(X);
    
    % propagare forward
    [a1 a2 a3 z2 z3 h] = forward_propag(rows, Theta1, Theta2, X);
    
    %gasim indexul cu valoare maxima de pe fiecare linie
    for i = 1 : rows
        [~, classes(i,1)] = max(a3(i,:));
    endfor
                  
endfunction
