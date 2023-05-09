function [a1 a2 a3 z2 z3 h] = forward_propag(rows, Theta1, Theta2, X)
    a1 = [ones(rows, 1) X];
    z2 = a1 * Theta1';
    len_z2 = length(z2);
    a2 = sigmoid(z2);
    a2 = [ones(len_z2, 1) a2];
    z3 = a2 * Theta2';
    a3 = sigmoid(z3);
    h = a3;
endfunction