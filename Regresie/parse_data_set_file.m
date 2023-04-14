function [Y, InitialMatrix] = parse_data_set_file(file_path)
    fid = fopen(file_path, 'r');
    size = fscanf(fid, '%d', [1 2]);
    disp(size)
    data = textscan(fid, '%s');
    
    Y = [];
    for i = 1 : size(2) + 1 : size(1) * (size(2) + 1)
        Y = [Y; str2num(data{1}{i})];
    endfor
    
    for i =  1 : size(2)
       InitialMatrix{i} = []; 
    endfor
    
    pos = 2;
    for k = 1 : size(2)
        for i = pos : size(2) + 1 : size(1) * (size(2) + 1)
            InitialMatrix{k} = [InitialMatrix{k}; data{1}{i}];
        endfor
        pos = pos + 1;
    endfor
    
endfunction
