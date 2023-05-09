function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  
  data = [y X];
  %vom amesteca informatia folosind un vector de perm aleatoare
  data = data(randperm(length(X)), :);
  
  %primele percent linii for reprez training-ul
  train_samples = floor(percent * length(data));
  train_data = data(1:train_samples, :);
  test_data = data((train_samples + 1):end, :);
  
  X_train = train_data(:,2 : end);
  y_train = train_data(:, 1);
  
  X_test = test_data(:, 2 : end);
  y_test = test_data(:, 1);
endfunction
