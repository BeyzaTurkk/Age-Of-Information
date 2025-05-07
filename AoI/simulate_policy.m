function [AoI, avgAoI] = simulate_policy(N, M, p, policy)
    AoI = zeros(1, N);     
    a = 0;                 
    m = M;                 
    last_update = 0;       

    for n = 1:N
        a_idx = a + 1;
        m_idx = m + 1;
        action = policy(n, m_idx, a_idx);  

        if action == 1 && m > 0
            m = m - 1;  % use transmission
            if rand() < p
                a = 1;              % successful transmission
                last_update = n;
            else
                a = a + 1;          % failure: AoI increases
            end
        else
            a = a + 1;              % wait :AoI increases
        end

        a = min(a, N);  
        AoI(n) = a;
    end

    avgAoI = mean(AoI);
end
