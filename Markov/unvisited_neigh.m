function [unvisited] = unvisited_neigh(adj, visited)
    neighs = find(adj);
    unvisited = 0;
    
    for i = 1 : length(neighs)
        if visited(neighs(i)) == 0
            unvisited = 1;
            return
        endif
    endfor
endfunction
