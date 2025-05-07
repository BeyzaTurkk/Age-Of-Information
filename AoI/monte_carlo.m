function avgAoI = monte_carlo(N, M, prob, T)
    totalAoI = 0;
    for trial = 1:T
        [aoi, ~] = compute_average_AoI_with_erasure(N, M, prob);
        totalAoI = totalAoI + aoi;
    end
    avgAoI = totalAoI / T;
end
