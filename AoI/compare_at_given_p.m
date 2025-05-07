% Parameters
N = 100;
M = 3;
p = 0.6;

% --- Feedback Policy (Dynamic Programming) ---
[V, policy] = bellman_recursive(N, M, p);
[AoI_feedback, avg_feedback] = simulate_policy(N, M, p, policy);

% --- Blind Strategy ---
[avg_blind, AoI_blind] = compute_average_AoI_with_erasure(N, M, p);

% --- Print average results ---
disp(['Average AoI (Feedback): ', num2str(avg_feedback)]);
disp(['Average AoI (Blind): ', num2str(avg_blind)]);

% --- Plot both AoI curves ---
figure;
plot(1:N, AoI_blind, '--r', 'LineWidth', 2); hold on;
plot(1:N, AoI_feedback, '-b', 'LineWidth', 2);
legend('Blind Strategy', 'Feedback Policy');
xlabel('Time Slot');
ylabel('AoI');
title(['AoI Comparison (p = ', num2str(p), ')']);
grid on;
saveas(gcf, 'aoi_comparison_timeline.png');
print(gcf, 'aoi_comparison_timeline', '-dpdf');