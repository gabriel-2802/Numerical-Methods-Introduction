function [decoded_path] = decode_path(path, lines, cols)
    path = path';
    decoded_path = zeros(length(path) - 1, 2);
    
    for i = 1 : length(path) - 1
        [decoded_path(i, 2), decoded_path(i, 1)] = ind2sub([cols lines], path(i));
    endfor
endfunction
