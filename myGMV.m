function gaussian = myGMV(mu, S, x)
% I assume mu is 1xD, S is DxD and test vector x is 1xD

    mu = mu';
    x = x';
    
    determinant = det(S);
    D = size(mu,2);
    
    x = x - mu;
    
    exponent = (x'/S)*x;
    y = exp(-0.5 * exponent);
    gaussian = y / sqrt((2*pi)^D * determinant);

end