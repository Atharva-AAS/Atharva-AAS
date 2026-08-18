# Iris Classification

## Overview

This project demonstrates a basic supervised machine learning workflow for classifying Iris flowers into three species using sepal and petal measurements.

## Dataset

The project uses the Iris dataset with the following features:

- Sepal length (cm)
- Sepal width (cm)
- Petal length (cm)
- Petal width (cm)

The target variable represents the Iris species.

## Project Workflow

The notebook follows a simple machine learning workflow:

1. Load the Iris dataset
2. Perform data-quality checks
3. Explore feature relationships using a pairplot
4. Create a stratified 80/20 train-test split
5. Train a Logistic Regression classifier
6. Evaluate model performance
7. Generate and interpret a confusion matrix
8. Draw conclusions from the results

## Exploratory Data Analysis

A Seaborn pairplot was used to examine relationships between the numerical features and observe how the three species are distributed across feature combinations.

## Model

Logistic Regression was used as the classification model and serves as a straightforward baseline for this multi-class classification problem.

## Evaluation

The model was evaluated on the held-out test set using accuracy and a confusion matrix.

The confusion matrix provides a class-level view of correct predictions and misclassifications.

## Key Learnings

This project provided hands-on practice with:

- Loading and inspecting structured data
- Data-quality checks
- Exploratory data analysis
- Stratified train-test splitting
- Classification with Scikit-learn
- Model evaluation
- Confusion matrix interpretation

## Limitations

The Iris dataset is small and relatively clean, so this project does not represent the complexity or scale typically encountered in real-world business datasets.

## Technologies Used

- Python
- Pandas
- Scikit-learn
- Seaborn

## Project Structure

iris-classification/
├── Iris_Classification.ipynb
└── README.md

## How to Run

Open `Iris_Classification.ipynb` in Google Colab, Jupyter Notebook, or VS Code and execute the notebook cells sequentially.
