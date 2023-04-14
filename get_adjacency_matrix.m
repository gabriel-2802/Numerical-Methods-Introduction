function [Adj] = get_adjacency_matrix(Labyrinth)
lb_size = size(Labyrinth);

% +2 reprezinta starile de WIN si LOSE
adj_size = lb_size(1) * lb_size(2) + 2;
Adj = sparse(adj_size, adj_size);
state = 1;

Adj(adj_size, adj_size) = 1;
Adj(adj_size - 1, adj_size - 1) = 1;

for i = 1 : lb_size(1)
    for j = 1 : lb_size(2)
        for k = 1 : 4
            bit = bitget(Labyrinth(i,j), k);
            switch (k)
                case 1
                    %Vest
                    if bit == 0
                        if j == 1
                            Adj(state, adj_size) = 1;
                        else
                            Adj(state, state - 1) = 1;
                            Adj(state - 1, state) = 1;
                        endif
                    endif
                case 2
                    %Estul
                    if bit == 0
                        if j == lb_size(2)
                            Adj(state, adj_size) = 1;
                        else
                            Adj(state, state + 1) = 1;
                            Adj(state + 1, state) = 1;
                        endif
                    endif
                case 3
                    %Sudul
                    if bit == 0
                        if i == lb_size(1)
                            Adj(state, adj_size - 1) = 1;
                        else
                            Adj(state, state + lb_size(2)) = 1;
                            Adj(state + lb_size(2), state) = 1;
                        endif
                    endif
               case 4
                %nordul
                if bit == 0
                    if i == 1
                        Adj(state, adj_size - 1) = 1;
                    else
                        Adj(state, state - lb_size(2)) = 1;
                        Adj(state - lb_size(2), state) = 1;
                    endif
                endif
            endswitch
        endfor
        state  = state + 1;
    endfor
endfor
endfunction