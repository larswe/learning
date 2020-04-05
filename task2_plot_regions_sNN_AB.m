function task2_plot_regions_sNN_AB()

    % Change to a larger step size for less precise but much faster
    % results, e.g. 0.005 or 0.01, as in 
    % "xs = -2:0.01:8;"
    % Use a smaller step size for even more precise, but slow, plotting.
    xs = -2:0.002:8;
    ys = -2:0.002:8;
    [Xs, Ys] = meshgrid(xs' ,ys');
    points = [Xs(:) , Ys(:)];
    classifiers = task2_sNN_AB(points);
    gscatter(Xs(:), Ys(:), classifiers);

end