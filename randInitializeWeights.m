function [W  b]= randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in



epsilon_init = 6^0.5 / (1 + L_in + L_out)^0.5;

%W = normrnd(0, sqrt(0.1), L_out, L_in);
%b = normrnd(0, sqrt(0.1), L_out, 1);

W = rand(L_out, 1 + L_in) * 2 * epsilon_init    -  epsilon_init;
%b =  rand(L_out, 1) * 2 * epsilon_init    -  epsilon_init;
b = 1;
% =========================================================================

end
