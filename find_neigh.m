function [neigh] = find_neigh(adj, probabilities)
    neighbours = find(adj);
        max_prob = -1;
        neigh = 0;
        for i = 1 : length(neighbours)
            if probabilities(neighbours(i)) > max_prob
                max_prob = probabilities(neighbours(i));
                neigh = neighbours(i);
            endif
        endfor
endfunction
