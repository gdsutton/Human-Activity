library('ProjectTemplate')
load.project()

for (dataset in project.info$data)
{
  message(paste('Showing top 5 rows of', dataset))
  print(head(get(dataset)))
}

# 560 variables
dim(X.train)

str(y.train)
y.train <- as.factor(y.train[,1])

# counts of column data types
table(sapply(X.train, class))
summary(X.train)

# classes are well balanced
table(y.train)

# there are a fair amount of highly correlated variables
corr_matrix <- cor(X.train,)
hist(corr_matrix, bins = 30)

library(caret)
library(e1071)
library(randomForest)

length(findCorrelation(corr_matrix, cutoff = 0.7))


# fit model in caret
train_ctrl <- trainControl(method = "boot", 
                           number = 5, 
                           verboseIter = TRUE,
                           returnResamp = 'all'
                           )

train <- train(x = X.train,
               y = y.train,
               preProcess = c("nzv","pca"),
               method = "rf",
               # tuneGrid = expand.grid(),
               trControl = train_ctrl
               )

plot(train)
