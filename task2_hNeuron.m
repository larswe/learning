function [Y] = task2_hNeuron(W, X)

% X is given as a collection of row vectors x. 
% For our formula w'*x to make sense, we transpose X in order to deal
% with column vectors x instead. 
transX = X';    % (DxN)
transW = W';    % (1x(D+1))

% We now want to augment the input vectors x by prepending a row of ones
N = size(transX, 2);
transX = [ones(1,N);transX];

% transW is 1x(D+1), transX is (D+1)xN
% we can multiply the two to get an 1xN vector we then need to transpose
Y = (transW * transX)';

% Now we change each of the n entries to 1 if the previous product was > 0,
% or to 0 otherwise. 
Y = Y > 0;
end

