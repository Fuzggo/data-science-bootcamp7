library(caret)
library(readxl)

# 1. split data
store <- read_excel("House Price India.xlsx", sheet = 1)

train_test_split <- function(data, trainRatio = 0.7) {
    set.seed(38)
    n <- nrow(data)
    id <- sample(1:n, size = trainRatio*n)
    train_data <- data[id, ]
    test_data <- data[-id, ]
    return(list(train=train_data, test = test_data))
}

split_data <- train_test_split(store, 0.7)
train_data <- split_data[[1]]
test_data <- split_data[[2]]

train_data$Price_norm <- log(train_data$Price)
test_data$Price_norm <- log(test_data$Price)

# 2. train model
set.seed(38)
model <- train(Price_norm ~ `number of bedrooms` + `number of bathrooms` +
                            `number of floors` + `grade of the house`,
                            data = train_data,
                            method = "lm")
print(model)

# 3. score model
p <- predict(model, newdata = test_data)

# 4. evaluate model
mae_matric <- function(actual,prediction) {
    abs_error <- abs(actual - prediction)
    mean(abs_error)
}
mae_matric(test_data$Price_norm, p)

mse_matric <- function(actual, prediction){
    sq_error <- (actual - prediction)**2
    mean(sq_error)
}
mse_matric(test_data$Price_norm, p)

rmse_matric <- function(actual, prediction){
    sq_error <- (actual - prediction)**2
    sqrt(mean(sq_error))
}
rmse_matric(test_data$Price_norm, p)

# 5 . save model
saveRDS(model, "linear_regression_House_Price_India.RDS")
