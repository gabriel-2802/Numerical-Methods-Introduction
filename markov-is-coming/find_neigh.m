function [neigh] = find_neigh(adj, probabilities)
    %gasim elementele nenule din matricea de adj
    neighbours = find(adj);
        max_prob = -1;
        neigh = 0;

    %cautam vecinul cu cea mai mare probab de castig
    for i = 1 : length(neighbours)
        if probabilities(neighbours(i)) > max_prob
            max_prob = probabilities(neighbours(i));
            neigh = neighbours(i);
        endif
    endfor
endfunction
