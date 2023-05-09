function [path] = heuristic_greedy(start_position, probabilities, Adj)
    sz = size(Adj,1);
    win = sz - 1;

    visited = sparse(sz, 1);
    path = [start_position];
    
    %cat timp path-ul are elemente nenule
    while nnz(path)
        position = path(end);
        if position == win
            path = path';
            return
        endif
        
        if unvisited_neigh(Adj(position, :), visited) == 0
            path(end) = [];
        endif
        
        %gasim vecinul cu cea mai mare probabilitate
        neigh = find_neigh(Adj(position, :), probabilities);
        visited(neigh) = 1;
        path = [path, neigh];
    endwhile
    path = path';
endfunction
