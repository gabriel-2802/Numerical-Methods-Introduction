function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
    [rows cols] = size(InitialMatrix);
    FeatureMatrix = [];
    
    for j = 1 : cols
        test = InitialMatrix{1, j};
        
        if strcmp(test, 'no') || strcmp(test, 'yes')
            new_col = zeros(rows, 1);
            
            for i = 1 : rows
                if strcmp(InitialMatrix{i,j}, 'yes')
                    new_col(i, 1) = 1;
                endif
            endfor
            FeatureMatrix = [FeatureMatrix new_col];
        
    elseif strcmp(test, 'semi-furnished') || strcmp(test, 'furnished') || strcmp(test, 'unfurnished')
        new_cols = zeros(rows, 2);
        for i = 1 : rows
            if strcmp(InitialMatrix{i,j}, 'semi-furnished')
                new_cols(i,1) = 1;
            elseif strcmp(InitialMatrix{i,j}, 'unfurnished')
                new_cols(i,2) = 1;
            endif
        endfor
        FeatureMatrix = [FeatureMatrix new_cols];
    
    else
        new_col = zeros(rows,1);
        for i = 1 : rows
            new_col(i,1) = str2num(InitialMatrix{i,j});
        endfor
        FeatureMatrix = [FeatureMatrix new_col];
        endif
    endfor
endfunction
