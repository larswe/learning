function corrMat = myCorr(S)
%myCorr computes the correlation matrix corresponding to a given
%covariance matrix.

%It uses the formula corr(x,y) = cov(x,y)/sd(x)sd(y), where
%sd(x) = cov(x,x) is the standard deviation of x
sds = sqrt(diag(S));
corrMat = S ./ (sds * sds');

end

