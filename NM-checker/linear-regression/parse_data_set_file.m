function [Y, InitialMatrix] = parse_data_set_file(file_path)
    fid = fopen(file_path, 'r');
    sz = fscanf(fid, '%d', [1 2]);
    data = textscan(fid, '%s', 'delimiter', '\n');
    Y = [];
    
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
