function [Link] = get_link_matrix(Labyrinth)
    Link = get_adjacency_matrix(Labyrinth);
    [sz sz] = size(Link);
    
    for i = 1 : sz
        el_nr = nnz(Link(i, :));
        Link(i, :) = Link(i, :) * (1/el_nr);
    endfor
endfunction
