function draw_PCA(X, Y, EigVects)
    PC(:,1) = EigVects(:,1);
    PC(:,2) = EigVects(:,2);
    PC_X = X * PC;
    
    gscatter(PC_X(:,1) , PC_X(:,2) , Y)
    xlabel("1st Principal Component");
    ylabel("2nd Principal Component");
    box on
end