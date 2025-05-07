
N = 100;
M = 3;
p = 0.8;


[V, policy] = bellman_recursive(N, M, p);


[aois, avgAoI] = simulate_policy(N, M, p, policy);
disp(['Simulated Average AoI using optimal policy: ', num2str(avgAoI)]);


figure;
plot(1:N, aois, 'LineWidth', 2);
xlabel('Time Slot');
ylabel('Age of Information');
title('AoI Evolution Over Time (Using Optimal Policy)');
grid on;


saveas(gcf, 'policy_based_aoi_plot.png');
