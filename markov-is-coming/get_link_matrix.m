function [Link] = get_link_matrix(Labyrinth)
    Link = get_adjacency_matrix(Labyrinth);
    [sz sz] = size(Link);

    %construim matricea stochastica
    for i = 1 : sz
        el_nr = nnz(Link(i, :));
        Link(i, :) = Link(i, :) * (1 / el_nr);
    endfor
endfunction
