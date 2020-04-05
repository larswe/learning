function [Y] = andNN(X)

    confidenceFactor = 100;

    % the AND boundary should sensibly cross (1, 0.5) and (0.5, 1).
    W = [-1.5 ;  1; 1];
    Y = task2_sNeuron(confidenceFactor * W, X);

end

