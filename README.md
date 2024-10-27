# Building a Feedforward Neural Network from Scratch using MATLAB

## Overview

This project demonstrates how to implement a feedforward neural network from scratch using MATLAB. The goal is to provide a clear understanding of the underlying principles of neural networks, including forward propagation, loss calculation, and backpropagation for training.

## Table of Contents

- [Features](#features)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Code Structure](#code-structure)
- [Example](#example)
- [Contributing](#contributing)
- [License](#license)

## Features

- Implementation of feedforward neural network architecture
- Forward propagation
- Backpropagation for training
- Support for various activation functions (e.g., sigmoid, ReLU)
- Loss function calculation (e.g., mean squared error)
- Training and validation capability

## Requirements

- MATLAB (R2020a or later recommended)
- Basic understanding of neural networks and MATLAB coding

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/feedforward-neural-network-matlab.git
   ```

2. Navigate to the project directory:

   ```bash
   cd feedforward-neural-network-matlab
   ```

## Usage

1. Open MATLAB.
2. Load the dataset (example datasets are provided in the `data` folder).
3. Set the parameters for the neural network (e.g., number of layers, neurons per layer).
4. Run the training script:

   ```matlab
   run_training.m
   ```

5. Evaluate the trained model on validation/test data.

## Code Structure

```
/feedforward-neural-network-matlab
│
├── /data                # Sample datasets
├── /functions           # Core functions for the neural network
│   ├── forward.m       # Forward propagation function
│   ├── backward.m      # Backpropagation function
│   ├── activate.m      # Activation function
│   └── loss.m          # Loss function
├── run_training.m      # Script to train the neural network
└── README.md           # Project documentation
```

## Example

To see the neural network in action, you can use the provided example in `run_training.m`. This example includes a simple dataset for binary classification and demonstrates how to train the network.

```matlab
% Load data
data = load('data/example_data.mat');

% Set parameters
input_size = 2; % Number of features
hidden_size = 3; % Neurons in hidden layer
output_size = 1; % Output neurons (for binary classification)
learning_rate = 0.01;
epochs = 1000;

% Train the network
train_network(data.X, data.y, input_size, hidden_size, output_size, learning_rate, epochs);
```

## Contributing

Contributions are welcome! Please feel free to submit a pull request or open an issue for any suggestions or improvements.

## License

This project is licensed under the MIT License.
