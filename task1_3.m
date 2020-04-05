function task1_3(S)

    [eVecs, eVals] = normEig(S);
    % eVecs are Eigenvectors (24*24), eVals the Eigenvalues(24*1)
    save("t1_EVecs.mat" , "eVecs");
    save("t1_EVals.mat" , "eVals");
    cumvar = cumsum(eVals);
    save("t1_Cumvar.mat" , "cumvar");
    minDims = findMinDims(cumvar);
    save("t1_MinDims.mat" , "minDims");
    
end

function [normalizedVecs, normalizedVals] = normEig(CovMat)
% normEig takes a covariance Matrix, uses library function eig to 
% compute Eigenvectors/values, before normalizing the vectors and 
% presenting the values as a column vector in descending order.
    
    [Vecs, Vals] = eig(CovMat);

    n = size(Vals,1);
    
    normalizedVecs = zeros(n,n);
    for i = 1:n
        if (Vecs(1,i) > 0)
            normalizedVecs(:,n+1-i) = Vecs(:,i);
        else
            normalizedVecs(:,n+1-i) = -1 .* Vecs(:,i);
        end
    end
   
    normalizedVals = flip(diag(Vals));
    
end

function dims = findMinDims(CumVarVec)
% findMinDims takes a cumulatime variance vector and returns a 4x1 vector
% dims, containing the min. number of dimensions needed to account for 
% 70/80/90/95% of the total variance

    n = size(CumVarVec,1);
    percentCumvar = CumVarVec ./ CumVarVec(n);
    %plot(percentCumvar , "b")
    %hold on
    %plot([0;1],[0,percentCumvar(1)] , "b")
    %yline(0.7)
    %yline(0.8)
    %yline(0.9)
    %yline(0.95)
    %xline(3)
    %xline(5)
    %xline(7)
    %xline(10)
    %ylim([-0.0001 , 1.01]);
    %xlim([0 , 24]);
    %box on
    
    currentDim = 1;
    currentRow = 1;
    currentBorder = 0.7;
    dims = zeros(4,1, 'int32');
    while (currentDim < 5)
    
        dimensionDone = 0;
    
        if (currentDim == 2)
            currentBorder = 0.8;
        elseif (currentDim == 3)
            currentBorder = 0.9;
        elseif (currentDim > 1)
            currentBorder = 0.95;
        end
    
        while (dimensionDone == 0)
            if (percentCumvar(currentRow) >= currentBorder)
                dims(currentDim) = currentRow;
                dimensionDone = 1;
                currentDim = currentDim + 1;
            else
                currentRow = currentRow + 1;
            end
        end
    end
end