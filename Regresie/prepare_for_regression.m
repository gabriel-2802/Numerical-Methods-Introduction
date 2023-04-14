function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
    cols = length(InitialMatrix);
    rows = length(InitialMatrix{1});
    
    FeatureMatrix = [];
    
    for j = 1 : cols
        old_col = InitialMatrix{j};
        
        if strcmp(old_col(1, :), 'no ') || strcmp(old_col(1, :), 'yes')
            new_col = zeros(rows, 1);
            for i = 1 : rows
                if strcmp(old_col(i, :) ,'yes')
                    new_col(i, 1) = 1; 
                endif
            endfor
            FeatureMatrix = [FeatureMatrix new_col];
        elseif strcmp(old_col(1, :), 'semi-furnished') || strcmp(old_col(1, :), 'unfurnished   ') || strcmp(old_col(1, :), 'furnished     ')
            new_cols = zeros(rows, 2);
            for i = 1 : rows
                if strcmp(old_col(i, :), 'semi-furnished')
                    new_cols(i, 1) = 1;
                elseif strcmp(old_col(i, :), 'unfurnished   ')
                    new_cols(i, 2) = 1;
                endif
            endfor
            FeatureMatrix = [FeatureMatrix new_cols];
        else
            new_col = str2num(old_col);
            FeatureMatrix = [FeatureMatrix new_col];
        endif
    endfor
endfunction
