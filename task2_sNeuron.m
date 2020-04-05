function [Y] = task2_sNeuron(W, X)

transX = X';    % (DxN)
transW = W';    % (1x(D+1))

N = size(transX, 2);
transX = [ones(1,N);transX];

Y = (transW * transX)';
% Currently Y = [a], which we can now change to [1/(1+e^(-a))]
Y = 1./(1+exp(-Y));
end

