function covarMat = myCov(X,mu)
%myCov computes the covariance matrix of data set X, where each row 
%corresponds to a piece of evidence, and each column to a variable.

%For each pair of indices (i,j), covarMat_i,j is E((x_i - E(x_i))*(x_j - E(x_j))). 
%We use the Bessel correction since we do not have the entire data set as
%input.
    n = size(X,1);
    X_mean_subtract = bsxfun(@minus , X , mu);
    covarMat = (1/n) .* (X_mean_subtract.' * X_mean_subtract); % MLE, as opposed to unbiased estimator

end

