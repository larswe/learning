function [Y] = task2_hNN_A(X)
% X is a 1x2 point

x1 = task2_hNeuron([1; -0.15161239442; -0.1762505786] , X);
x2 = task2_hNeuron([0.69116623675; 0.73606346015; -1] , X);
x3 = task2_hNeuron([-1; 0.19447201772; 0.18174770005] , X);
x4 = task2_hNeuron([1; -0.88649715037; 0.83373474893] , X);

y1 = task2_hNeuron([-1; 1; 1] , [x1 x2]);
y2 = task2_hNeuron([-1; 1; 1] , [x3 x4]);

Y = task2_hNeuron([-1; 1; 1] , [y1 y2]);

end

