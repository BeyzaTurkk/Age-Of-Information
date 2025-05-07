
N = 100;          
M = 3;            
T = 1000;         


p_values = 0.1:0.1:1.0;
aoi_results = zeros(size(p_values));

% Run simulation for each success probability
for i = 1:length(p_values)
    p = p_values(i);
    aoi_results(i) = monte_carlo(N, M, p, T);
end

%
disp('Success Probabilities and Corresponding Average AoI:');
disp(table(p_values', aoi_results', 'VariableNames', {'SuccessProb', 'AvgAoI'}));

% Plot results
figure;
plot(p_values, aoi_results, '-o', 'LineWidth', 2);
xlabel('Transmission Success Probability (p)');
ylabel('Estimated Average AoI');
title('AoI vs. Transmission Success Probability');
grid on;

% Save the plot
saveas(gcf, 'aoi_vs_success_probability.png');
print(gcf, 'aoi_vs_success_probability', '-dpdf');
