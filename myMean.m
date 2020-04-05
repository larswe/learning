function mu = myMean(X)
% myMean returns the mean value of a column vector, or the corresponding
% 1xD vector if X is an NxD matrix. 
    n = size(X,1);
    mu = (1/n) * sum(X , 1);
end

