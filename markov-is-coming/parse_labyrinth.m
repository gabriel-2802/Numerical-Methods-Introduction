function [Labyrinth] = parse_labyrinth(file_path)
    fid = fopen(file_path, 'r');

    %citim dimensiunile matricei
    sz = fscanf(fid, '%d', [1 2]);
    data = textscan(fid, '%s', 'delimiter', '\n');
    
    for i = 1 : sz(1);
        words = strsplit(data{1}{i}, " ");

        for j = 1 : sz(2)
            Labyrinth(i, j) = str2num(words{j});
        endfor
    endfor

    fclose(fid);

    
endfunction