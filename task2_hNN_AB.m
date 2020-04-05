function [Y] = task2_hNN_AB(X)
% X is a 1x2 point

%Y = ~task2_hNN_A(X) & task2_hNN_B(X); is what we want to model

x1 = task2_hNN_A(X);
x2 = task2_hNN_B(X);

% we need a neuron with binary inputs x1 and x2
% that outputs 1 iff x1 = 0 and x2 = 1
% the line -x + y = 0 will do the job -> w = [0 -1 1]'
Y = task2_hNeuron([0; -1; 1], [x1 x2]);

end

function [Y] = task2_hNN_B(X)

x1 = task2_hNeuron([1; -0.45472382882; 0.62515234659], X);
x2 = task2_hNeuron([-0.59096578715; 1; -0.46763378206], X);
x3 = task2_hNeuron([-1; 0.54523317933; -0.00454517007], X);
x4 = task2_hNeuron([1; -0.12647211684; -0.12517283073], X);

% Note: Because B is self-intersecting, for X to be inside B, 
% we have necessary and sufficient conditions
% (x1 & x4) & (x2 | x3),
% where x2/x3 correspond to boundaries BC/CD. C is the node that
% "makes" B non-convex since the according internal angle is more
% than 180 degrees. 

% To model an OR-function, weights (0, 1, 1) will do the job for 
% binary inputs 

y1 = task2_hNeuron([-1; 1; 1] , [x1 x4]); % AND
y2 = task2_hNeuron([0; 1; 1] , [x2 x3]);  % OR

Y = task2_hNeuron([-1; 1; 1] , [y1 y2]);

end
