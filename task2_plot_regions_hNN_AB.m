function task2_plot_regions_hNN_AB()

    xs = -2:0.001:8;
    ys = -2:0.001:8;
    [Xs, Ys] = meshgrid(xs' ,ys');
    points = [Xs(:) , Ys(:)];
    classifiers = task2_hNN_AB(points);
    gscatter(Xs(:), Ys(:), classifiers);

end