%%Initialization
clear ; close all; clc
fprintf('\nLoading Files...\n')
input_layer_size  = 69;  
hidden_layer_size = 128;   % 128 hidden units
num_labels = 48;          % 48 labels, 

% =========== Part 1: Loading  Data =============


% Load Training Data
[raw_y,raw_X] = input_train('train_out_map.txt');


%   ================ Part 2: Initializing Pameters ================

f=[]
for y=5:5
    for t=7:7
        %parameters setting
        batch = pow2(t);
        yita_initial = 0.0001+y*0.01;   %learning rate
        yita = yita_initial;
        decay = 0.9999;
        
        
        fprintf('\nInitializing Neural Network Parameters ...\n')

        [initial_W1, initial_b1] = randInitializeWeights(input_layer_size, hidden_layer_size);
        [initial_W2, initial_b2] = randInitializeWeights(hidden_layer_size, num_labels);

        % Unroll parameters
        initial_nn_params = [initial_W1(:) ; initial_W2(:) ];

        nn_params = initial_nn_params;

        % ================ Part 3: Compute Cost (Feedforward) ================
     
        fprintf('\nFeedforward Using Neural Network ...\n')

        % Weight regularization parameter 
        lambda = 0;
        y = raw_y(:, 1:batch);
        X = raw_X(:, 1:batch);
        J = nnCostFunction(initial_nn_params, input_layer_size, hidden_layer_size, ...
                           num_labels, X, y, lambda);

        fprintf(['Cost at initial parameters : %f '...
                 '\n\n'], J);

        fprintf('\nProgram paused. Press enter to continue.\n');
        % pause;

        % =================== Part 4: Training NN ===================
       
        fprintf('\nTraining Neural Network... \n')



        for epoch = 1:10
                for k = 0:(floor(1124824/batch)-2)
                
                        y = raw_y(:, (k*batch+1):(k*batch+batch));
                        X = raw_X(:, (k*batch+1):(k*batch+batch));
                        %input data
                         [J , grad] = nnCostFunction(nn_params, ...
                                                   input_layer_size, ...
                                                   hidden_layer_size, ...
                                                   num_labels, ...
                                                   X, y, lambda);

                         nn_params =  nn_params   -   yita * grad ;
                         yita = decay * yita;
                          fprintf(['Current epoch : %f     k : %f    '...
                                     ], epoch,k);
                         fprintf(['Cost at current parameters : %f '...
                                     '\n\n'], J);
                end
        end

        fprintf('Program paused. Press enter to continue.\n');
        % pause;

        % ================= Part 5: Implement Predict =================

        input_samples = 10000;        

                y = raw_y(:, 1  : input_samples);
                X = raw_X(:,1 : input_samples);
                pred = predict(nn_params, X);

                pred_test = zeros(48,size(X,2));

                for i=1:size(X,2)
                   pred_test(pred(1,i),i) = 1;
                end
                

        fprintf('\nTraining Set Accuracy: %f\n', (100 - sum(sum(abs(pred_test  - y )))/ input_samples/2 * 100));
        msg = [yita_initial,batch,(100 - sum(sum(abs(pred_test  - y )))/ input_samples/2 * 100)];
        f=[f;msg];
    end
end
dlmwrite('accuracy.txt',f);

