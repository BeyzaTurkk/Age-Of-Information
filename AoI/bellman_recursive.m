function [V, policy] = bellman_recursive(N, M, p)
    
    V = inf(N+1, M+1, N+1);      
    policy = zeros(N, M+1, N+1);  

    
    V(N+1, :, :) = 0;

    for n = N-1:-1:0
        for m = 0:M
            for a = 0:N
                
                n_index = n + 1;
                m_index = m + 1;
                a_index = a + 1;

                % Wait (do nothing)
                new_a = min(a + 1, N);         %AoI increases
                new_a_index = new_a + 1;         
                wait_cost = a + V(n_index + 1, m_index, new_a_index);

                best_cost = wait_cost;
                best_policy = 0;

                %  Transmit 
                if m > 0
                    success_cost = V(n_index + 1, m_index - 1, 2);          % AoI resets to 1 and transmissions decremented
                    fail_cost = V(n_index + 1, m_index - 1, new_a_index);     % AoI increases because of fail but transmissions decremented

                    transmit_cost = a + p * success_cost + (1 - p) * fail_cost;

                    if transmit_cost < wait_cost
                        best_cost = transmit_cost;
                        best_policy = 1;
                    end
                end

                % Store 
                V(n_index, m_index, a_index) = best_cost;
                policy(n_index, m_index, a_index) = best_policy;
            end
        end
    end
end
