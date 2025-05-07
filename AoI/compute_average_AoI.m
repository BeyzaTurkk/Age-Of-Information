function [avgAoI, AoI] = compute_average_AoI(N, M)
    AoI = zeros(1, N); 
    last_update = 0;
    
    step = floor(N / (M + 1));
    tx_times = step * (1:M);  
    
    for t = 1:N
        if ismember(t, tx_times)
            AoI(t) = 1;           
            last_update = t;
        else
            AoI(t) = t - last_update; 
        end
    end
    
    avgAoI = mean(AoI);  
end
