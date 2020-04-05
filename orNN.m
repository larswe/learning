function [Y] = orNN(X)

    confidenceFactor = 100;

    % given probabilistic inputs x1, x2, we want to find a linear boundary
    % approximating a logical OR function.
    % It makes sense for the boundary to cross the points (0.5 , 0) and (0, 0.5).
    % And this gives us a line. It's not perfect but it's something.
    W = [-1/2;  1; 1];
    Y = task2_sNeuron(confidenceFactor * W, X);

end