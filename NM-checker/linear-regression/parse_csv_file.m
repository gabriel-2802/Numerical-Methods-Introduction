function [Y, InitialMatrix] = parse_csv_file(file_path)
    fid = fopen(file_path, 'r');
    line = fgetl(fid);
    data = textscan(fid, '%s', 'delimiter', '\n');
    Y = [];
    
    for i = 1 : length(data{1});
        words = strsplit(data{1}{i}, ",");
        Y(i) = str2num(words{1});
        for j = 2 : 13
            InitialMatrix{i,j - 1} = words{j};
        endfor
    endfor
    Y = Y';
    fclose(fid);
endfunction
