function map = MyKFolds(X,Y,Kfolds)
    % Assuming that we have classes 1...C and that all classes are 
    % "non-empty" w.r. to our data, the biggest number in Y is the number
    % of classes. 
    C = max(Y);

    n = length(X);
    
    map = zeros(n,1);
    for c = 1:C
        % Nc is the number of elements in class c
        Nc = sum(Y(:)==c);
        Mc = floor( double(Nc) / double(Kfolds) );
        
        currentIndexX = 1;
        
        % The first (k-1) bins get Mc samples each
        for k = 1:(Kfolds-1)
            currentIndexBin = 1;
            
            while (currentIndexBin <= Mc)
                if Y(currentIndexX) == c
                    map(currentIndexX) = k;
                    currentIndexBin = currentIndexBin + 1;
                end
                currentIndexX = currentIndexX + 1;
            end
        end
        
        % The k-th bin gets the remaining samples
        while (currentIndexX <= n)
            if Y(currentIndexX) == c
                map(currentIndexX) = Kfolds;
            end
            currentIndexX = currentIndexX + 1;
        end
        
    end
end

