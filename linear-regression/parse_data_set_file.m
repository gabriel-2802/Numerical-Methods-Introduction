function [Y, InitialMatrix] = parse_data_set_file(file_path)
    fid = fopen(file_path, 'r');
    %citim dimensiunile matricei
    sz = fscanf(fid, '%d', [1 2]);

    %citim intreaga matrice intr-o celua pe linii
    data = textscan(fid, '%s', 'delimiter', '\n');
    Y = [];
    
    %'spargem' fiecare linie in cuvinte
    for i = 1 : sz(1);
        words = strsplit(data{1}{i}, " ");
        Y(i) = str2num(words{1});
        for j = 2 : length(words)
            InitialMatrix{i, j - 1} = words{j};
        endfor
    endfor
    Y = Y';
    fclose(fid);
endfunction
