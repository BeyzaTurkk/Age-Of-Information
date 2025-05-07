% Parameters
N = 100;
M = 3;
p = 0.8;
T = 1000;  % Monte Carlo runs

% ---- Feedback strategy ----
[V, policy] = bellman_recursive(N, M, p);
total_AoI_feedback = 0;

for i = 1:T
    [~, avgAoI] = simulate_policy(N, M, p, policy);
    total_AoI_feedback = total_AoI_feedback + avgAoI;
end

avg_feedback = total_AoI_feedback / T;

% ---- Blind strategy ----
total_AoI_blind = 0;

for i = 1:T
    [avgAoI_blind, ~] = compute_average_AoI_with_erasure(N, M, p);
    total_AoI_blind = total_AoI_blind + avgAoI_blind;
end

avg_blind = total_AoI_blind / T;

% ---- Display results ----
disp(['Average AoI (Feedback Policy): ', num2str(avg_feedback)]);
disp(['Average AoI (Blind Strategy): ', num2str(avg_blind)]);

% ---- Plot comparison ----
figure;
bar([avg_blind, avg_feedback]);
set(gca, 'XTickLabel', {'Blind', 'Feedback'});
ylabel('Average AoI');
title(['Comparison of Strategies (p = ', num2str(p), ')']);
grid on;

% Save plot
saveas(gcf, 'strategy_comparison.png');
print(gcf, 'strategy_comparison', '-dpdf');
