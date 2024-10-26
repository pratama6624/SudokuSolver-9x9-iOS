# Sudoku Solver and Generator Techniques

This repository contains a list of 14 non-backtracking algorithms that are commonly used to solve or generate valid Sudoku boards. Each algorithm offers a unique approach, making it suitable for different levels of complexity and use cases.

## Table of Contents
1. [Dancing Links (DLX)](#1-dancing-links-dlx)
2. [Constraint Propagation](#2-constraint-propagation)
3. [Simulated Annealing](#3-simulated-annealing)
4. [Genetic Algorithm (GA)](#4-genetic-algorithm-ga)
5. [Brute Force](#5-brute-force)
6. [Stochastic Search](#6-stochastic-search)
7. [Exact Cover Problem Solver](#7-exact-cover-problem-solver)
8. [Linear Programming (LP)](#8-linear-programming-lp)
9. [Machine Learning (Supervised Learning)](#9-machine-learning-supervised-learning)
10. [Depth-First Search (DFS) with Pruning](#10-depth-first-search-dfs-with-pruning)
11. [Breadth-First Search (BFS)](#11-breadth-first-search-bfs)
12. [Greedy Algorithm](#12-greedy-algorithm)
13. [Rule-Based Systems](#13-rule-based-systems)
14. [Neural Networks](#14-neural-networks)

## 1. Dancing Links (DLX)
* **Description**: A technique implemented by Donald Knuth to efficiently solve the exact cover problem, making it ideal for solving Sudoku.
* **Usage**: Primarily used to solve complex Sudoku boards.
* **Pros**: Very fast for finding solutions.
* **Cons**: Not typically used for generating puzzles.

## 2. Constraint Propagation
* **Description**: Uses constraints to limit possible values for each cell, reducing the search space.
* **Usage**: Suitable for both generating and solving Sudoku.
* **Pros**: Efficiently reduces complexity without guessing.
* **Cons**: Can struggle with puzzles that require significant guessing.

## 3. Simulated Annealing
* **Description**: A probabilistic technique that searches for a global solution by making random changes while avoiding local optima.
* **Usage**: Useful for generating unique Sudoku boards.
* **Pros**: Can find solutions even for difficult puzzles.
* **Cons**: Random nature can make it slow.

## 4. Genetic Algorithm (GA)
* **Description**: Mimics natural evolution with selection, mutation, and crossover to find a valid Sudoku solution.
* **Usage**: Can generate or solve Sudoku puzzles.
* **Pros**: Good for exploring a large solution space.
* **Cons**: Requires a large number of iterations for complex boards.

## 5. Brute Force
* **Description**: A straightforward technique that tries every possible value until it finds a solution.
* **Usage**: Can be used to generate or solve any puzzle.
* **Pros**: Guarantees a solution if one exists.
* **Cons**: Extremely slow for complex puzzles.

## 6. Stochastic Search
* **Description**: A random search method that gradually improves by adjusting incorrect guesses.
* **Usage**: Mainly for generating Sudoku boards with unique solutions.
* **Pros**: Can handle large solution spaces.
* **Cons**: May not always find the optimal solution.

## 7. Exact Cover Problem Solver
* **Description**: Treats Sudoku as an exact cover problem, solving it with matrix techniques.
* **Usage**: Ideal for solving but not generating.
* **Pros**: Fast and accurate.
* **Cons**: Limited to solving, not suitable for generating puzzles.

## 8. Linear Programming (LP)
* **Description**: Uses a system of linear equations to model Sudoku constraints and find a solution.
* **Usage**: Primarily for solving complex boards.
* **Pros**: Rigorous and precise.
* **Cons**: Difficult to apply to generation.

## 9. Machine Learning (Supervised Learning)
* **Description**: Uses a trained model to predict the next number based on the puzzle state.
* **Usage**: Can help generate or assist in solving.
* **Pros**: Adaptable with training data.
* **Cons**: Requires large datasets for training.

## 10. Depth-First Search (DFS) with Pruning
* **Description**: Searches deeply into possible solutions while cutting off non-viable paths early.
* **Usage**: Good for generating puzzles by filling in numbers step-by-step.
* **Pros**: Efficiently reduces search space.
* **Cons**: Can get stuck without proper heuristics.

## 11. Breadth-First Search (BFS)
* **Description**: Explores the puzzle layer-by-layer, ensuring a thorough exploration.
* **Usage**: Mostly for solving.
* **Pros**: Comprehensive search.
* **Cons**: Can be memory intensive.

## 12. Greedy Algorithm
* **Description**: Selects the best option at each step based on local criteria.
* **Usage**: Useful for generating boards.
* **Pros**: Quick to implement.
* **Cons**: Does not guarantee an optimal solution.

## 13. Rule-Based Systems
* **Description**: Uses predefined rules to fill in Sudoku cells.
* **Usage**: Suitable for both generating and solving.
* **Pros**: Deterministic and logical.
* **Cons**: Limited by the complexity of the rule set.

## 14. Neural Networks
* **Description**: Trains a neural network to predict correct numbers based on the board state.
* **Usage**: Useful for generating or suggesting hints.
* **Pros**: Adaptable to different puzzle types.
* **Cons**: Requires significant training data.
