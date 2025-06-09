from collections import Counter
from random import choices
import matplotlib.pyplot as plt
import pandas as pd
import itertools
import numpy as np
from mpl_toolkits.mplot3d import Axes3D

# Settings
initial_counts = {
    'apple': 1,
    'banana': 1,
    'cherry': 1,
    'date': 1
}
iterations = 10000
snapshot_interval = 100

elements = list(initial_counts.keys())
pairs = list(itertools.combinations(elements, 2))
pair_labels = [f"{a}-{b}" for a, b in pairs]

counter = Counter(initial_counts)
diff_history = {label: [] for label in pair_labels}

# Run simulation and store pairwise differences
for step in range(iterations):
    picked = choices(elements, weights=list(counter.values()), k=1)[0]
    counter[picked] += 1

    if step % snapshot_interval == 0:
        for (a, b), label in zip(pairs, pair_labels):
            diff_history[label].append(counter[a] - counter[b])

# Sort labels by final difference
final_diffs = {label: values[-1] for label, values in diff_history.items()}
sorted_labels = sorted(pair_labels, key=lambda lbl: abs(final_diffs[lbl]), reverse=True)

# Prepare 3D grid
X = np.arange(0, iterations, snapshot_interval)
Y = np.arange(len(sorted_labels))
X_grid, Y_grid = np.meshgrid(X, Y)
Z = np.array([diff_history[label] for label in sorted_labels])

# Plot 3D surface
fig = plt.figure(figsize=(12, 7))
ax = fig.add_subplot(111, projection='3d')

surf = ax.plot_surface(X_grid, Y_grid, Z, cmap='coolwarm', linewidth=0, antialiased=False)

ax.set_title("3D Grid of Pairwise Differences Over Time (Sorted)")
ax.set_xlabel("Iteration")
ax.set_ylabel("Pair (sorted by final difference)")
ax.set_zlabel("Difference (A - B)")
ax.set_yticks(np.arange(len(sorted_labels)))
ax.set_yticklabels(sorted_labels)
fig.colorbar(surf, ax=ax, shrink=0.5, aspect=10)

plt.tight_layout()
plt.show()
