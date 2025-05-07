# Age of Information Optimization

This project explores Age of Information (AoI) minimization strategies using MATLAB.

The work is based on a research problem , and includes both baseline implementations and advanced dynamic programming solutions.

## 📌 Contents

- `compute_average_AoI.m`  
  Basic AoI calculation with fixed transmission slots (no feedback or erasures).

- `compute_average_AoI_with_erasure.m`  
  Blind strategy with erasure probability and Monte Carlo simulation.

- `bellman_recursive.m`  
  Feedback-based AoI minimization using dynamic programming and Bellman recursion.

- `compare_strategies.m`  
  Visual comparison between blind and feedback-aware strategies.

- `compare_at_given_p.m`  
  Analysis of AoI performance at different success probabilities.

## 📊 Plots

The repo includes several `.png` plots visualizing AoI over time and comparing strategies under various conditions.

## 🔬 Next Steps

The next phase involves extending the model to minimize **peak AoI** instead of average AoI. The setup and results will be added soon.

## 💻 Tools Used

- MATLAB (core logic and simulation)
- Monte Carlo methods
- Dynamic programming (Bellman equation)
- LaTeX for reporting (to be added in a separate Overleaf project)

## 👤 Author

Beyza Türk
