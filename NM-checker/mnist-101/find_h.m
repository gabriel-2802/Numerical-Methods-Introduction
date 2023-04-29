function [h grad] = find_h(X, theta1, theta2, rows, lambda, Y)
    Delta2 = zeros(size(theta2));
    Delta1 = zeros(size(theta1));
    
    for i = 1 : rows
        a1 = [1 X(i, :)]';
        z2 = theta1 * a1;
        
        a2 = sigmoid(z2);
        a2 = [1; a2];
        
        z3 = theta2 * a2;
        a3 = sigmoid(z3);
        
        h(i,:) = a3;
        
        delta3 = (a3 - Y(i,:)');
        delta2 = (theta2(:,2:end)' * delta3) .* (sigmoid(z2) .* (1 - sigmoid(z2)));
        
        Delta2 = Delta2 + delta3 * a2';
        Delta1 = Delta1 + delta2 * a1';
        
    endfor
    
    Theta1(:,1) = 0;
    Theta2(:,1) = 0;
    
    Delta1 = Delta1 / rows + lambda * Theta1 / rows;
    Delta2 = Delta2 / rows + lambda * Theta2 / rows;
    grad = 0;
    
    grad = [Delta1(:); Delta2(:)];
endfunction
