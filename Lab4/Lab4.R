library(ggplot2)
library(dplyr)
library(class)   
library(caret)   

wine_data <- read.csv('/Users/sutherlandbrown/Downloads/wine/wine.data')
colnames(wine_data)


colnames(wine_data) <- c("Class", "Alcohol", "Malic_Acid", "Ash", "Alcalinity_Ash", "Magnesium",
                         "Total_Phenols", "Flavanoids", "Nonflav_Phenols", "Proanthocyanins",
                         "Color_Intensity", "Hue", "OD280_OD315", "Proline")


X <- wine_data[, -1]
y <- as.factor(wine_data$Class)
X_scaled <- scale(X)
pca_model <- prcomp(X_scaled, center = TRUE, scale. = TRUE)
X_pca <- as.data.frame(pca_model$x)


ggplot(X_pca, aes(x = PC1, y = PC2, color = y)) +
  geom_point() +
  labs(title = "Wine Dataset - PCA Projection", x = "1st Principal Component", y = "2nd Principal Component") +
  theme_minimal()


pc1_contributions <- abs(pca_model$rotation[, 1])
contribution_df <- data.frame(Feature = colnames(X), PC1_Contribution = pc1_contributions)
contribution_df <- contribution_df[order(-contribution_df$PC1_Contribution), ]

print(contribution_df)

least_contributing_vars <- tail(contribution_df$Feature, 2)
X_reduced <- X[, !(colnames(X) %in% least_contributing_vars)]


pca_model_reduced <- prcomp(scale(X_reduced), center = TRUE, scale. = TRUE)

set.seed(123)
trainIndex <- createDataPartition(y, p = 0.7, list = FALSE)
X_train <- X[trainIndex, ]
X_test <- X[-trainIndex, ]
y_train <- y[trainIndex]
y_test <- y[-trainIndex]

knn_model_original <- knn(train = scale(X_train), test = scale(X_test), cl = y_train, k = 5)


X_pca_train <- X_pca[trainIndex, 1:3]
X_pca_test <- X_pca[-trainIndex, 1:3]

knn_model_pca <- knn(train = X_pca_train, test = X_pca_test, cl = y_train, k = 5)


conf_matrix_original <- table(Predicted = knn_model_original, Actual = y_test)
conf_matrix_pca <- table(Predicted = knn_model_pca, Actual = y_test)

print("Confusion Matrix - Original Features:")
print(conf_matrix_original)

print("Confusion Matrix - PCA Features:")
print(conf_matrix_pca)


classification_report_original <- confusionMatrix(as.factor(knn_model_original), as.factor(y_test))
classification_report_pca <- confusionMatrix(as.factor(knn_model_pca), as.factor(y_test))

print("Classification Report - Original Features:")
print(classification_report_original)

print("Classification Report - PCA Features:")
print(classification_report_pca)



