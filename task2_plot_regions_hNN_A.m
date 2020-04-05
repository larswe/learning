function task2_plot_regions_hNN_A()

    xs = 2:0.001:4;
    ys = 2:0.001:4;
    [Xs, Ys] = meshgrid(xs' ,ys');
    points = [Xs(:) , Ys(:)];
    classifiers = task2_hNN_A(points);
    gscatter(Xs(:), Ys(:), classifiers)

end

