function [matrix] = initialize_weights(L_prev, L_next)
  epsilon = sqrt(6) / sqrt(L_prev + L_next);
  matrix = rand(L_next, L_prev + 1);
  
  %cream o matrice cu valori in intervalul dat
  matrix = 2 * epsilon * (matrix - 0.5);
endfunction
