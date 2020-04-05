function task1_mgc_cv(X,Y,CovKind,epsilon,Kfolds)

    PMap = MyKFolds(X,Y,Kfolds);
    kstr = int2str(Kfolds);
    name = "t1_mgc_" + kstr + "cv_PMap.mat";
    save(name , "PMap");
    
    C = max(Y);
    D = size(X,2);
    
    totalCM = zeros(C,C);
    
    for p = 1:Kfolds
        
        Ms = zeros(C,D);
        Covs = zeros(C,D,D);
        Priors = zeros(1,C);
        
        for c = 1:C
            learnDataFromClass = X(PMap(:) ~= p & Y(:) == c , :);
            Ms(c,:) = myMean(learnDataFromClass);
            
            if (CovKind == 1) % Full covariance matrix
                Cov = myCov(learnDataFromClass, Ms(c,:));
            elseif (CovKind == 2) % Diagonal Covariance Matrix
                Cov = diag(diag(myCov(learnDataFromClass, Ms(c,:))));
            else % Shared covariance matrix
                Cov = myCov(X, myMean(X));
            end
            
            StandardisedCov = Cov +epsilon.*eye(D);
            Covs(c,:,:)= StandardisedCov;
            % squeeze(Covs(c,:,:)) now gives the cov matrix
            % e.g. squeeze(Covs(c,:,:)) - Cov gives epislon.*eye(D)
            
            Priors(1,c) = size(learnDataFromClass , 1) / size(X(PMap(:) ~= p),1);
        end
        
        pstr = int2str(p);
        name = "t1_mgc_" + kstr + "cv" + pstr + "_Ms.mat";
        save(name , "Ms");
        kindstr = int2str(CovKind);
        name = "t1_mgc_" + kstr + "cv" + pstr + "_ck" + kindstr + "_CM.mat";
        save(name, "Covs");
        
        % We will now try to classify each test point -> Compute P(x|c)
        testData = X(PMap(:) == p , :);
        m = size(testData , 1);
        testLikelihoods = zeros(m, C);
        for i = 1:m
           for c = 1:C
               testLikelihoods(i,c) = myGMV(Ms(c,:),squeeze(Covs(c,:,:)),testData(i,:));
           end
        end
        testProbabilities = bsxfun(@times, testLikelihoods, Priors);
        
        %  We can now make predictions for our test data 
        testPredictions = zeros(m,1);
        for i = 1:m
            currentRow = testProbabilities(i,:);
            testPredictions(i) = find(ismember(currentRow, max(currentRow(:))));
        end
        
        % Now we want to compute the confusion matrix 
        CM = zeros(C,C);
        indexP = 1;
        indexX = 1;
        while (indexP <= m)
            if PMap(indexX) == p
                i = Y(indexX);
                j = testPredictions(indexP);
                CM(i,j) = CM(i,j) + 1;
                indexP = indexP + 1;
            end
            indexX = indexX + 1;
        end
       
        name = "t1_mgc_" + kstr + "cv" + pstr + "_ck" + kindstr + "_CM.mat";
        save(name , "CM");
        
        totalCM = totalCM + CM ./ (Kfolds * m);
    end
    
     L = Kfolds + 1;
     lstr = int2str(L);
     
    name = "t1_mgc_" + kstr + "cv" + lstr + "_ck" + kindstr + "_CM.mat";
    save(name, "totalCM");
end

