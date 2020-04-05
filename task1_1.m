function task1_1(X,Y)
%TASK1_1 saves the covariance and correlation matrices of
%data set X, given NxD matrix X and according Nx1 label vector Y

% m is a row vector corresponding to the mean of each column / variable
    m = myMean(X);
    S = myCov(X,m);
    save ("t1_S.mat" , "S");
    R = myCorr(S);
    save("t1_R.mat" , "R");

end

function corrMat = myCorr(S)
%myCorr computes the correlation matrix corresponding to a given
%covariance matrix.

%It uses the formula corr(x,y) = cov(x,y)/sd(x)sd(y), where
%sd(x) = cov(x,x) is the standard deviation of x
    sds = sqrt(diag(S));
    corrMat = S ./ (sds * sds');

end

