function [Labyrinth] = parse_labyrinth(file_path)

data = dlmread(file_path);
Labyrinth = data(2:end, :);
endfunction