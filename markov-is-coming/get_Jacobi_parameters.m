function [G, c] = get_Jacobi_parameters(Link)
     [sz sz] = size(Link);
     
     G = Link(1 : sz - 2, 1 : sz - 2);
     c = Link(1 : sz - 2, sz - 1);
 
endfunction
