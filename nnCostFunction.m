function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)

% Reshape nn_params back into the parameters, the weight matrices
% for our 2 layer neural network
W1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));           %  128 x 70

W2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));                   %  48 x 129

m = size( X , 2);
             
X = [ones( 1, m) ;  X];     % Add ones to the X data matrix


J = 0;
W1_grad = zeros(size(W1));
W2_grad = zeros(size(W2));
Delta1 = zeros(hidden_layer_size , input_layer_size+1);
Delta2 = zeros(num_labels , hidden_layer_size+1);


for cur_example = 1:m       
        y_cur_example = y( : , cur_example);     %48 x 1
        X_cur_example = X( : , cur_example) ;    % 70 x 1
        z_1 = W1 * X_cur_example ;      %128 x 1
        a_1 = sigmoid(z_1) ;                % 128 x 1
        a_1 = [1 ; a_1];                         % 129 x 1
        z_2= W2 * a_1 ;                % 48 x 1
        a_2 = sigmoid(z_2) ;               % 48 x 1  (output)
        
        delta_2 = a_2 - y_cur_example;   %48 x 1
        delta_1 = W2' * delta_2 .* sigmoidGradient([1 ; z_1]);    % 129 x 1
        delta_1= delta_1(2 : end );  % 128 x 1
        
        Delta1 = Delta1 + delta_1 * X_cur_example';   % 128 x 70
        Delta2 = Delta2 + delta_2 * a_1';  % 48 x 129
        
        cur_example_cost = - y_cur_example .* log(a_2)  -  y_cur_example .*  log(1 - a_2) ;
        J = J + sum(cur_example_cost);
end

W1_grad = 1/m * Delta1;
W2_grad = 1/m * Delta2;
J = J/m 
    +  lambda/2/m * ( sum(sum(W1( : , 2:end ) .^2 )) + sum(sum(W2( : , 2:end ) .^2 ))  );


regterm_W1 = lambda/m * W1;
regterm_W2 = lambda/m * W2;

W1_grad = W1_grad + regterm_W1;
W2_grad = W2_grad + regterm_W2;


% Unroll gradients
grad = [W1_grad(:)  ; W2_grad(:) ];


end
