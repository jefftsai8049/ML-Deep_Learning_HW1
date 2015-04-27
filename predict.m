function p = predict(nn_params, X)

input_layer_size = 69;
hidden_layer_size = 128;
num_labels = 48;
m = size( X , 2);

W1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));           %  128 x 70

W2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));                   %  48 x 129


p = zeros( 1, m);
X = [ones( 1 , m) ;  X];     % Add ones to the X data matrix

        z_1 = W1 * X ;      %128 x  m
        a_1 = sigmoid(z_1) ;                % 128 x m
        a_1 = [ones(1 , m) ; a_1];                         % 129 x m
        z_2= W2 * a_1 ;                % 48 x m
        a_2 = sigmoid(z_2) ;               % 48 x m  (output)             
        
        
[dummy, p] = max(a_2);

% =========================================================================


end
